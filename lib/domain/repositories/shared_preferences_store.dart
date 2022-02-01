import '../../config/constants/strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesStore {
  SharedPreferences? _sp;

  Future<SharedPreferences?> _init() async {
    _sp = await SharedPreferences.getInstance();
    return _sp;
  }

  Future<double?> getQuizLastScore() async {
    var sp = await _init();
    return sp?.getDouble(AppStrings.lastQuizScore);
  }

  Future<void> setQuizLastScore(value) async {
    final sp = await _init();
    await sp?.setDouble(AppStrings.lastQuizScore, value);
  }

  Future<void> setScoreCredentials({
    required String score,
    required String category,
  }) async {
    final sp = await _init();
    await sp?.setStringList(AppStrings.scoreCredentials, [
      score,
      category,
    ]);
  }

  Future<List<String>> getScoreCredentials() async {
    final sp = await _init();
    return sp?.getStringList(AppStrings.scoreCredentials) ?? [];
  }

  Future<bool?> getFirstSeen() async {
    var sp = await _init();
    return sp?.getBool(AppStrings.firstSeen);
  }

  Future<void> setFirstSeen() async {
    final sp = await _init();
    await sp?.setBool(AppStrings.firstSeen, true);
  }
}
