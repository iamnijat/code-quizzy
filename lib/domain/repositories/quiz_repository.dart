import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../config/constants/palette.dart';
import '../../config/exceptions/server_exceptions.dart';
import '../../config/utils/correct_answer_definer.dart';
import '../../config/utils/quiz_filter_controller.dart';
import '../../data/models/response_model/quiz_response.dart';
import 'score_store_repository.dart';
import 'server_repository.dart';
import '../services/navigation/index.dart';

class QuizRepository with ChangeNotifier {
  QuizRepository(this._serverRepository);
  final ServerRepository _serverRepository;
  final PageController pageController = PageController();
  List<QuizResponse?>? questionsList = [];
  List<String?>? scoreCredentials;
  int? questionsListLength = 0;
  int currentPage = 1;
  String? topicIcon;
  String? numOfQuestions;
  String? topic;
  String? difficulty;
  String? correctAns = '';
  String? selectedAns;
  double? score;
  ApiException? error;
  int _numOfCorrectAns = 0;
  int get numOfCorrectAns => _numOfCorrectAns;
  bool? _isAnswered = false;
  bool get isAnswered => _isAnswered!;

  void onPageChanged(int index) {
    currentPage = index + 1;
    notifyListeners();
  }

  void nextQuestion({required BuildContext context, required int index}) {
    if (correctAns == selectedAns) _numOfCorrectAns++;
    if (currentPage != questionsListLength!) {
      _isAnswered = false;
      if (pageController.hasClients) {
        pageController.animateToPage(
          currentPage,
          duration: const Duration(milliseconds: 250),
          curve: Curves.fastOutSlowIn,
        );
      }
    } else {
      score = ((numOfCorrectAns / questionsListLength!) * 100)
        ..toStringAsFixed(2);
      var provider = Provider.of<ScoreStoreRepository>(context, listen: false);
      provider.setQuizScore(score);
      provider.setScoreCredentials(
          category: topic.toString(), imgUrl: topicIcon.toString());
      Provider.of<NavigationService>(context, listen: false)
          .openScorePage(context, withReplacement: true);
    }
    notifyListeners();
  }

  void checkAns(String selectedAnswer, int selectedIndex) {
    selectedAns = selectedAnswer;
    _isAnswered = true;
    correctAns = CorrectAnswerDefiner.getCorrectAnswer(
        index: selectedIndex, questionsList: questionsList);
    notifyListeners();
  }

  Future<void> getQuizData(BuildContext context) async {
    _clearQuizList();
    await _loadQuestions(
      context: context,
      filter: QuizFilters.normal,
      category: topic,
      difficulty: difficulty,
      limit: numOfQuestions,
    );
  }

  Future<void> getRandomQuizData(BuildContext context) async {
    _clearQuizList();
    await _loadQuestions(
      context: context,
      filter: QuizFilters.random,
      category: null,
      difficulty: null,
      limit: null,
    );
  }

  Future<void> getCategoryQuizData(BuildContext context) async {
    _clearQuizList();
    await _loadQuestions(
      context: context,
      filter: QuizFilters.category,
      category: topic,
      difficulty: difficulty,
      limit: numOfQuestions,
    );
  }

  /// A topic can advertise quizzes and still return no questions, so an empty
  /// list is treated as a failure rather than an empty quiz.
  Future<void> _loadQuestions({
    required BuildContext context,
    required String filter,
    required String? category,
    required String? difficulty,
    required String? limit,
  }) async {
    try {
      final questions = await _serverRepository.getQuizData(
        filter: filter,
        category: category,
        difficulty: difficulty,
        limit: limit,
      );
      if (questions.isEmpty) throw const NoQuestionsException();
      questionsList = questions;
      questionsListLength = questions.length;
      error = null;
      notifyListeners();
    } on ApiException catch (e) {
      _failWith(context, e);
    } catch (_) {
      _failWith(context, const ServerException());
    }
  }

  void _failWith(BuildContext context, ApiException exception) {
    error = exception;
    questionsList = [];
    questionsListLength = 0;
    notifyListeners();
    if (!context.mounted) return;
    Provider.of<NavigationService>(context, listen: false)
        .openErrorPage(context, withReplacement: true);
  }

  Future<void> getLastQuizScore(BuildContext context) async {
    score = await Provider.of<ScoreStoreRepository>(context, listen: false)
        .quizLastScore;
    notifyListeners();
  }

  Future<void> getScoreCredentials(BuildContext context) async {
    var provider = Provider.of<ScoreStoreRepository>(context, listen: false);
    final _lastScore = await provider.quizLastScore;
    if (_lastScore != null) {
      topic = await provider.category;
      topicIcon = await provider.imgUrl;
    }
    notifyListeners();
  }

  void setNumOfQuestions({required String? counterValue}) {
    numOfQuestions = counterValue;
    notifyListeners();
  }

  /// Stored verbatim - the questions endpoint matches `?category=` against the
  /// category name, so "SQL Queries" and "Node.js" must survive untouched.
  void setTopic({required String? topicStr}) {
    topic = topicStr;
    notifyListeners();
  }

  void setTopicIcon({required String? iconName}) {
    topicIcon = iconName;
    notifyListeners();
  }

  void setDifficulty({required String? difficultyStr}) {
    difficulty = difficultyStr;
    notifyListeners();
  }

  void _clearQuizList() {
    questionsList = [];
    questionsListLength = 0;
    currentPage = 1;
    correctAns = '';
    selectedAns = null;
    _isAnswered = false;
    _numOfCorrectAns = 0;
    error = null;
  }

  //Getting the right color in case answered question
  Color getTheRightColor(String? selectedAnswer) {
    if (isAnswered) {
      if (selectedAns == selectedAnswer) {
        return AppPalette.homeButtonColor;
      } else {
        return AppPalette.progressBarColor;
      }
    } else {
      return AppPalette.progressBarColor;
    }
  }
}
