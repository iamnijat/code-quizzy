import '../../config/constants/assets.dart';
import '../models/view_model/difficulty_model.dart';

class Difficulty {
  /// The API accepts EASY, MEDIUM, HARD and EXPERT; anything else is rejected.
  /// EXPERT has no artwork of its own, so it is only reachable through
  /// "ANY DIFFICULTY", which leaves the filter off entirely.
  static List<DifficultyModel> getDifficultyList() {
    return [
      DifficultyModel(
        slideTitle: "EASY",
        slideImgUrl: AppImages.easy,
        value: "EASY",
      ),
      DifficultyModel(
        slideTitle: "MEDIUM",
        slideImgUrl: AppImages.medium,
        value: "MEDIUM",
      ),
      DifficultyModel(
        slideTitle: "HARD",
        slideImgUrl: AppImages.difficult,
        value: "HARD",
      ),
      DifficultyModel(
        slideTitle: "ANY DIFFICULTY",
        slideImgUrl: AppImages.anyDifficulty,
        value: null,
      ),
    ];
  }
}
