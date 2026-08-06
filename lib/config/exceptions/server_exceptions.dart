/// Failures the quiz API can hand back, mapped to text the error page shows.
abstract class ApiException implements Exception {
  const ApiException(this.title, this.message);

  final String title;
  final String message;

  @override
  String toString() => '$runtimeType($title: $message)';
}

class MissingApiKeyException extends ApiException {
  const MissingApiKeyException()
      : super(
          'Missing API Key',
          'Build the app with --dart-define=QUIZ_API_KEY=your_key',
        );
}

class UnauthorizedException extends ApiException {
  const UnauthorizedException()
      : super(
          'Invalid API Key',
          'The quiz service rejected this API key. Check that it is current.',
        );
}

class RateLimitException extends ApiException {
  const RateLimitException()
      : super(
          'Too Many Requests',
          'The quiz service is rate limiting us. Try again in a minute.',
        );
}

class NetworkException extends ApiException {
  const NetworkException()
      : super(
          'Connection Problem',
          'Check your connection, please come back again',
        );
}

class ServerException extends ApiException {
  const ServerException([String message = 'Please try again later.'])
      : super('Server Problem', message);
}

class NoQuestionsException extends ApiException {
  const NoQuestionsException()
      : super(
          'No Questions Yet',
          'This topic has no questions available. Pick another topic.',
        );
}
