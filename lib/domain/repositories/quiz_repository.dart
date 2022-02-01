import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../config/constants/palette.dart';
import '../../config/utils/correct_answer_definer.dart';
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
  String? topicImage;
  String? numOfQuestions;
  String? topic;
  String? difficulty;
  String? correctAns = '';
  String? selectedAns;
  double? score;
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
          category: topic.toString(), imgUrl: topicImage.toString());
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
    questionsList = [];
    questionsListLength = 0;
    currentPage = 1;
    _numOfCorrectAns = 0;
    correctAns = '';
    selectedAns;
    questionsList = await _serverRepository.getQuizData(
        context: context,
        filter: 'normal_quiz',
        category: topic,
        difficulty: difficulty,
        limit: numOfQuestions);
    questionsListLength = questionsList?.length;
    notifyListeners();
  }

  Future<void> getRandomQuizData(BuildContext context) async {
    _clearQuizList();
    correctAns = '';
    selectedAns;
    questionsList = await _serverRepository.getQuizData(
        context: context,
        filter: 'random_quiz',
        category: '',
        difficulty: '',
        limit: '');
    questionsListLength = questionsList?.length;
    notifyListeners();
  }

  Future<void> getCategoryQuizData(BuildContext context) async {
    _clearQuizList();
    correctAns = '';
    selectedAns;
    questionsList = await _serverRepository.getQuizData(
        context: context,
        filter: 'category_quiz',
        category: topic,
        difficulty: difficulty,
        limit: numOfQuestions);
    questionsListLength = questionsList?.length;
    notifyListeners();
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
      topicImage = await provider.imgUrl;
    }
    notifyListeners();
  }

  void setNumOfQuestions({required String? counterValue}) {
    numOfQuestions = counterValue;
    notifyListeners();
  }

  void setTopic({required String? topicStr}) {
    topic = topicStr?.toLowerCase().capitalize();
    notifyListeners();
  }

  void setImage({required String? imgUrl}) {
    topicImage = imgUrl;
    notifyListeners();
  }

  void setDifficulty({required String? difficultyStr}) {
    difficulty = difficultyStr?.toLowerCase();
    notifyListeners();
  }

  void _clearQuizList() {
    questionsList = [];
    questionsListLength = 0;
    currentPage = 1;
    numOfQuestions = '0';
    _numOfCorrectAns = 0;
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

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
