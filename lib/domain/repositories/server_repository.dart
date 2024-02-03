import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:quiz_programming/config/utils/quiz_filter_controller.dart';
import 'package:quiz_programming/domain/services/navigation/index.dart';
import '../../config/constants/strings.dart';
import '../../data/models/response_model/quiz_response.dart';

class ServerRepository {
  final cl = Client();

  //Get Quiz Data
  Future<List<QuizResponse?>?> getQuizData(
      {required BuildContext context,
      required String filter,
      required String? category,
      required String? difficulty,
      required String? limit}) async {
    var param = QuizFilterController.getParams(
        filter: filter,
        category: category,
        difficulty: difficulty,
        limit: limit);
    final _response = await cl.get(_getParsedUri(param.toString()));
    if (_response.successResponse) {
      List<QuizResponse?>? quizList = (jsonDecode(_response.body) as List)
          .map((e) => e == null
              ? null
              : QuizResponse.fromJson(e as Map<String, dynamic>))
          .toList();
      quizList
          .removeWhere((e) => e == null || e.multipleCorrectAnswers == "true");
      return quizList;
    } else {
      Provider.of<NavigationService>(context, listen: false)
          .openErrorPage(context, withReplacement: true);
      return [];
    }
  }

  Uri _getParsedUri(String route, [Map<String, dynamic>? params]) {
    return Uri.parse('${AppStrings.apiHost}$route')
        .replace(queryParameters: params);
  }
}

extension DioResponseExtension on Response {
  bool get hasWrongCredentials => statusCode == 422;

  bool get tooManyRequests => statusCode == 429;

  bool get successResponse => statusCode >= 200 && statusCode < 300;
}
