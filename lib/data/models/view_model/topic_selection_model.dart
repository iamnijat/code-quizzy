class TopicSelectionModel {
  final String? title;
  final String? imgUrl;
  bool isSelected;

  TopicSelectionModel({
    required this.title,
    required this.imgUrl,
    this.isSelected = false,
  });
}
