class DifficultyModel {
  final String? slideImgUrl;
  final String? slideTitle;

  /// What the API is sent. `null` means "don't filter by difficulty".
  final String? value;

  DifficultyModel({
    required this.slideImgUrl,
    required this.slideTitle,
    this.value,
  });
}
