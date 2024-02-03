class QuizFilterController {
  static String? getParams({
    required String filter,
    required String? category,
    required String? difficulty,
    required String? limit,
  }) {
    String? newParams;
    //Students Section
    if (filter == 'normal_quiz') {
      newParams = '&category=$category&difficulty=$difficulty&limit=$limit';
    }
    if (filter == 'random_quiz') {
      newParams = '&limit=10';
    }
    if (filter == 'category_quiz') {
      newParams = '&category=$category&limit=10';
    }

    return newParams;
  }
}
