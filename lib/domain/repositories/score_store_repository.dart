import 'shared_preferences_store.dart';

class ScoreStoreRepository {
  final SharedPreferencesStore _sharedPreferencesStore;
  const ScoreStoreRepository(this._sharedPreferencesStore);

  Future<double?> get quizLastScore =>
      _sharedPreferencesStore.getQuizLastScore();

  Future<List<String>?> get scoreCredentials =>
      _sharedPreferencesStore.getScoreCredentials();

  Future<String> get imgUrl async =>
      (await _sharedPreferencesStore.getScoreCredentials())[0];
  Future<String> get category async =>
      (await _sharedPreferencesStore.getScoreCredentials())[1];
  void setQuizScore(value) {
    _sharedPreferencesStore.setQuizLastScore(value);
  }

  void setScoreCredentials({required String imgUrl, required String category}) {
    _sharedPreferencesStore.setScoreCredentials(
        score: imgUrl, category: category);
  }
}
