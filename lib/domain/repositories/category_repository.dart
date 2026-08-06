import 'package:flutter/material.dart';
import '../../config/exceptions/server_exceptions.dart';
import '../../data/models/response_model/category_response.dart';
import 'server_repository.dart';

class CategoryRepository with ChangeNotifier {
  CategoryRepository(this._serverRepository);
  final ServerRepository _serverRepository;

  List<CategoryGroup> groups = <CategoryGroup>[];
  bool isLoading = false;
  ApiException? error;

  bool get hasCategories => groups.isNotEmpty;

  Future<void> load({bool force = false}) async {
    if (isLoading || (hasCategories && !force)) return;

    isLoading = true;
    error = null;
    notifyListeners();

    try {
      final fetched = await _serverRepository.getCategories();
      //quizCount == 0 means the topic is guaranteed to be empty. A non-zero
      //count is not a guarantee it has questions, so the quiz flow still has to
      //handle an empty result.
      groups = fetched
          .map((group) => group.copyWith(
                categories: group.categories
                    .where((category) => category.quizCount > 0)
                    .toList(),
              ))
          .where((group) => group.categories.isNotEmpty)
          .toList();
    } on ApiException catch (e) {
      error = e;
      groups = <CategoryGroup>[];
    } catch (_) {
      error = const ServerException();
      groups = <CategoryGroup>[];
    }

    isLoading = false;
    notifyListeners();
  }
}
