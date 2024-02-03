import '../../data/models/response_model/quiz_response.dart';

class CorrectAnswerDefiner {
  static String? getCorrectAnswer(
      {required int index, required List<QuizResponse?>? questionsList}) {
    String? correctAns;
    var correctAnswerList = questionsList?[index]!.correctAnswers;
    var answers = questionsList?[index]!.answers;
    if (correctAnswerList!.answerACorrect == "true") {
      correctAns = answers!.answerA!;
    }
    if (correctAnswerList.answerBCorrect == "true") {
      correctAns = answers!.answerB!;
    }
    if (correctAnswerList.answerCCorrect == "true") {
      correctAns = answers!.answerC!;
    }
    if (correctAnswerList.answerDCorrect == "true") {
      correctAns = answers!.answerD!;
    }
    if (correctAnswerList.answerECorrect == "true") {
      correctAns = answers!.answerE!;
    }
    if (correctAnswerList.answerFCorrect == "true") {
      correctAns = answers!.answerF!;
    }

    return correctAns;
  }
}
