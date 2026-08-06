abstract class AppStrings {
  //Server Repo
  //Injected at build time so the key never lands in the repo:
  //  flutter run --dart-define=QUIZ_API_KEY=qa_sk_xxx
  static const apiKey = String.fromEnvironment('QUIZ_API_KEY');
  static const hasApiKey = apiKey != '';

  static const apiScheme = 'https';
  static const apiHost = 'quizapi.io';
  static const questionsPath = '/api/v1/questions';
  static const categoriesPath = '/api/v1/categories';

  //Shared Prefrences
  static const lastQuizScore = 'last_quiz_score';
  static const scoreCredentials = "score_credentials";
  static const firstSeen = "first_seen";
}
