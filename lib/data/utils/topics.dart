import '../../config/constants/assets.dart';
import '../models/view_model/topic_selection_model.dart';

class Topics {
  static List<TopicSelectionModel> getAllTopics() {
    return [
      TopicSelectionModel(
        title: "Linux",
        imgUrl: AppImages.linuxPicture,
        isSelected: true,
      ),
      TopicSelectionModel(
        title: "Bash",
        imgUrl: AppImages.githubPicture,
        isSelected: false,
      ),
      TopicSelectionModel(
        title: "Docker",
        imgUrl: AppImages.dockerPicture,
        isSelected: false,
      ),
      TopicSelectionModel(
        title: "SQL",
        imgUrl: AppImages.sqlPicture,
        isSelected: false,
      ),
      TopicSelectionModel(
        title: "CMS",
        imgUrl: AppImages.cmsPicture,
        isSelected: false,
      ),
      TopicSelectionModel(
        title: "Code",
        imgUrl: AppImages.codingPicture,
        isSelected: false,
      ),
      TopicSelectionModel(
        title: "DevOps",
        imgUrl: AppImages.devopsPicture,
        isSelected: false,
      ),
    ];
  }
}
