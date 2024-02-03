import '../../config/constants/assets.dart';
import '../models/view_model/difficulty_model.dart';

class Difficulty {
  static List<DifficultyModel> getDifficultyList() {
    return [
      DifficultyModel(
        slideTitle: "EASY",
        slideImgUrl: AppImages.easy,
      ),
      DifficultyModel(slideTitle: "MEDIUM", slideImgUrl: AppImages.medium),
      DifficultyModel(
          slideTitle: "DIFFICULT", slideImgUrl: AppImages.difficult),
      DifficultyModel(
          slideTitle: "ANY DIFFICULTY", slideImgUrl: AppImages.anyDifficulty),
    ];
  }
}
