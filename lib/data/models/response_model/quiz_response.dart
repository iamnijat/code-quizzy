class QuizResponse {
  final String? id;
  final String? text;
  final String? type;
  final String? difficulty;
  final String? explanation;
  final String? category;
  final String? quizId;
  final String? quizTitle;
  final List<String> tags;
  final List<AnswerOption> answers;

  const QuizResponse({
    this.id,
    this.text,
    this.type,
    this.difficulty,
    this.explanation,
    this.category,
    this.quizId,
    this.quizTitle,
    this.tags = const <String>[],
    this.answers = const <AnswerOption>[],
  });

  QuizResponse.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String?,
        text = json['text'] as String?,
        type = json['type'] as String?,
        difficulty = json['difficulty'] as String?,
        explanation = json['explanation'] as String?,
        category = json['category'] as String?,
        quizId = json['quizId'] as String?,
        quizTitle = json['quizTitle'] as String?,
        tags = (json['tags'] as List?)
                ?.map((e) => e.toString())
                .toList(growable: false) ??
            const <String>[],
        answers = (json['answers'] as List?)
                ?.whereType<Map<String, dynamic>>()
                .map(AnswerOption.fromJson)
                .toList() ??
            const <AnswerOption>[];

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'text': text,
        'type': type,
        'difficulty': difficulty,
        'explanation': explanation,
        'category': category,
        'quizId': quizId,
        'quizTitle': quizTitle,
        'tags': tags,
        'answers': answers.map((e) => e.toJson()).toList(),
      };

  /// The quiz only scores one tap per question, so questions with more than one
  /// correct option are filtered out. The API no longer sends the old
  /// `multiple_correct_answers` flag, so derive it from the answers.
  bool get hasMultipleCorrectAnswers =>
      answers.where((answer) => answer.isCorrect).length > 1;

  bool get isAnswerable => text != null && answers.isNotEmpty;

  String? get correctAnswerText {
    for (final answer in answers) {
      if (answer.isCorrect) return answer.text;
    }
    return null;
  }
}

class AnswerOption {
  final String? id;
  final String? text;
  final bool isCorrect;

  const AnswerOption({this.id, this.text, this.isCorrect = false});

  AnswerOption.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String?,
        text = json['text'] as String?,
        isCorrect = json['isCorrect'] == true;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'text': text,
        'isCorrect': isCorrect,
      };
}
