import '../../data/models/response_model/quiz_response.dart';

class CorrectAnswerDefiner {
  static String? getCorrectAnswer(
      {required int index, required List<QuizResponse?>? questionsList}) {
    if (questionsList == null || index < 0 || index >= questionsList.length) {
      return null;
    }
    return questionsList[index]?.correctAnswerText;
  }
}
