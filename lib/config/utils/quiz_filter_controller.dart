abstract class QuizFilters {
  static const normal = 'normal_quiz';
  static const random = 'random_quiz';
  static const category = 'category_quiz';
}

class QuizFilterController {
  static const defaultLimit = '10';

  /// Difficulties the questions endpoint accepts. Anything else is a 400, so
  /// "any difficulty" has to be expressed by leaving the parameter out.
  static const difficulties = <String>['EASY', 'MEDIUM', 'HARD', 'EXPERT'];

  static Map<String, String> getParams({
    required String filter,
    required String? category,
    required String? difficulty,
    required String? limit,
  }) {
    final params = <String, String>{};

    //Students Section
    if (filter == QuizFilters.normal) {
      _put(params, 'category', category);
      _putDifficulty(params, difficulty);
      params['limit'] = _limitOr(limit, defaultLimit);
    }
    if (filter == QuizFilters.random) {
      params['limit'] = defaultLimit;
    }
    if (filter == QuizFilters.category) {
      _put(params, 'category', category);
      params['limit'] = defaultLimit;
    }

    return params;
  }

  static void _put(Map<String, String> params, String key, String? value) {
    if (value != null && value.trim().isNotEmpty) params[key] = value.trim();
  }

  static void _putDifficulty(Map<String, String> params, String? difficulty) {
    final value = difficulty?.trim().toUpperCase();
    if (value != null && difficulties.contains(value)) {
      params['difficulty'] = value;
    }
  }

  static String _limitOr(String? limit, String fallback) {
    final parsed = int.tryParse(limit?.trim() ?? '');
    return (parsed == null || parsed <= 0) ? fallback : parsed.toString();
  }
}
