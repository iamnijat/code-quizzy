import 'dart:convert';
import 'package:http/http.dart';
import 'package:quiz_programming/config/utils/quiz_filter_controller.dart';
import '../../config/constants/strings.dart';
import '../../config/exceptions/server_exceptions.dart';
import '../../data/models/response_model/category_response.dart';
import '../../data/models/response_model/quiz_response.dart';

class ServerRepository {
  final cl = Client();

  //Get Quiz Data
  Future<List<QuizResponse>> getQuizData({
    required String filter,
    required String? category,
    required String? difficulty,
    required String? limit,
  }) async {
    final params = QuizFilterController.getParams(
      filter: filter,
      category: category,
      difficulty: difficulty,
      limit: limit,
    );
    final data = await _getData(AppStrings.questionsPath, params);
    return data
        .whereType<Map<String, dynamic>>()
        .map(QuizResponse.fromJson)
        .where((quiz) => quiz.isAnswerable && !quiz.hasMultipleCorrectAnswers)
        .toList();
  }

  //Get the topic list the questions endpoint can actually filter on
  Future<List<CategoryGroup>> getCategories() async {
    final data = await _getData(AppStrings.categoriesPath, const {});
    return data
        .whereType<Map<String, dynamic>>()
        .map(CategoryGroup.fromJson)
        .toList();
  }

  /// Unwraps the `{success, data, meta}` envelope every v1 endpoint returns.
  Future<List<dynamic>> _getData(
      String path, Map<String, String> params) async {
    if (!AppStrings.hasApiKey) throw const MissingApiKeyException();

    final Response response;
    try {
      response = await cl.get(_getParsedUri(path, params), headers: _headers);
    } on Exception {
      throw const NetworkException();
    }

    if (response.hasWrongCredentials) throw const UnauthorizedException();
    if (response.tooManyRequests) throw const RateLimitException();
    if (!response.successResponse) throw ServerException(_errorOf(response));

    final dynamic decoded;
    try {
      decoded = jsonDecode(response.body);
    } on FormatException {
      throw const ServerException('The quiz service sent a malformed reply.');
    }
    if (decoded is! Map<String, dynamic> || decoded['data'] is! List) {
      throw const ServerException('The quiz service sent an unexpected reply.');
    }
    return decoded['data'] as List;
  }

  Map<String, String> get _headers => const {
        'Authorization': 'Bearer ${AppStrings.apiKey}',
        'Accept': 'application/json',
      };

  Uri _getParsedUri(String route, [Map<String, dynamic>? params]) => Uri(
        scheme: AppStrings.apiScheme,
        host: AppStrings.apiHost,
        path: route,
        queryParameters: (params == null || params.isEmpty) ? null : params,
      );

  String _errorOf(Response response) {
    try {
      final decoded = jsonDecode(response.body);
      if (decoded is Map && decoded['error'] is String) {
        return decoded['error'] as String;
      }
    } on FormatException {
      //fall through to the generic message
    }
    return 'The quiz service returned ${response.statusCode}.';
  }
}

extension DioResponseExtension on Response {
  bool get hasWrongCredentials => statusCode == 401 || statusCode == 422;

  bool get tooManyRequests => statusCode == 429;

  bool get successResponse => statusCode >= 200 && statusCode < 300;
}
