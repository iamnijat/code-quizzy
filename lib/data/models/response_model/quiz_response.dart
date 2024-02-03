class QuizResponse {
  int? id;
  String? question;
  dynamic description;
  Answers? answers;
  String? multipleCorrectAnswers;
  CorrectAnswers? correctAnswers;
  String? correctAnswer;
  dynamic explanation;
  dynamic tip;
  List<Tags>? tags;
  String? category;
  String? difficulty;

  QuizResponse(
      {this.id,
      this.question,
      this.description,
      this.answers,
      this.multipleCorrectAnswers,
      this.correctAnswers,
      this.correctAnswer,
      this.explanation,
      this.tip,
      this.tags,
      this.category,
      this.difficulty});

  QuizResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    description = json['description'];
    answers =
        json['answers'] != null ? Answers.fromJson(json['answers']) : null;
    multipleCorrectAnswers = json['multiple_correct_answers'];
    correctAnswers = json['correct_answers'] != null
        ? CorrectAnswers.fromJson(json['correct_answers'])
        : null;
    correctAnswer = json['correct_answer'];
    explanation = json['explanation'];
    tip = json['tip'];
    if (json['tags'] != null) {
      tags = <Tags>[];
      json['tags'].forEach((v) {
        tags!.add(Tags.fromJson(v));
      });
    }
    category = json['category'];
    difficulty = json['difficulty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['question'] = question;
    data['description'] = description;
    if (answers != null) {
      data['answers'] = answers!.toJson();
    }
    data['multiple_correct_answers'] = multipleCorrectAnswers;
    if (correctAnswers != null) {
      data['correct_answers'] = correctAnswers!.toJson();
    }
    data['correct_answer'] = correctAnswer;
    data['explanation'] = explanation;
    data['tip'] = tip;
    if (tags != null) {
      data['tags'] = tags!.map((v) => v.toJson()).toList();
    }
    data['category'] = category;
    data['difficulty'] = difficulty;
    return data;
  }
}

class Answers {
  String? answerA;
  String? answerB;
  String? answerC;
  String? answerD;
  String? answerE;
  String? answerF;

  Answers(
      {this.answerA,
      this.answerB,
      this.answerC,
      this.answerD,
      this.answerE,
      this.answerF});

  Answers.fromJson(Map<String, dynamic> json) {
    answerA = json['answer_a'];
    answerB = json['answer_b'];
    answerC = json['answer_c'];
    answerD = json['answer_d'];
    answerE = json['answer_e'];
    answerF = json['answer_f'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['answer_a'] = answerA;
    data['answer_b'] = answerB;
    data['answer_c'] = answerC;
    data['answer_d'] = answerD;
    data['answer_e'] = answerE;
    data['answer_f'] = answerF;
    return data;
  }
}

class CorrectAnswers {
  String? answerACorrect;
  String? answerBCorrect;
  String? answerCCorrect;
  String? answerDCorrect;
  String? answerECorrect;
  String? answerFCorrect;

  CorrectAnswers(
      {this.answerACorrect,
      this.answerBCorrect,
      this.answerCCorrect,
      this.answerDCorrect,
      this.answerECorrect,
      this.answerFCorrect});

  CorrectAnswers.fromJson(Map<String, dynamic> json) {
    answerACorrect = json['answer_a_correct'];
    answerBCorrect = json['answer_b_correct'];
    answerCCorrect = json['answer_c_correct'];
    answerDCorrect = json['answer_d_correct'];
    answerECorrect = json['answer_e_correct'];
    answerFCorrect = json['answer_f_correct'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['answer_a_correct'] = answerACorrect;
    data['answer_b_correct'] = answerBCorrect;
    data['answer_c_correct'] = answerCCorrect;
    data['answer_d_correct'] = answerDCorrect;
    data['answer_e_correct'] = answerECorrect;
    data['answer_f_correct'] = answerFCorrect;
    return data;
  }
}

class Tags {
  String? name;

  Tags({this.name});

  Tags.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    return data;
  }
}
