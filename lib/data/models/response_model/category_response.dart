class CategoryGroup {
  final String? id;
  final String? name;
  final String? slug;

  /// Lucide icon name, resolved to a Material icon by [CategoryIcons].
  final String? icon;
  final List<QuizCategory> categories;

  const CategoryGroup({
    this.id,
    this.name,
    this.slug,
    this.icon,
    this.categories = const <QuizCategory>[],
  });

  CategoryGroup.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String?,
        name = json['name'] as String?,
        slug = json['slug'] as String?,
        icon = json['icon'] as String?,
        categories = (json['categories'] as List?)
                ?.whereType<Map<String, dynamic>>()
                .map(QuizCategory.fromJson)
                .toList() ??
            const <QuizCategory>[];

  CategoryGroup copyWith({List<QuizCategory>? categories}) => CategoryGroup(
        id: id,
        name: name,
        slug: slug,
        icon: icon,
        categories: categories ?? this.categories,
      );
}

class QuizCategory {
  final String? id;

  /// The value the questions endpoint expects for `?category=` - it matches on
  /// the category name, not the slug.
  final String? name;
  final String? slug;
  final int quizCount;
  final List<String> tags;

  const QuizCategory({
    this.id,
    this.name,
    this.slug,
    this.quizCount = 0,
    this.tags = const <String>[],
  });

  QuizCategory.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String?,
        name = json['name'] as String?,
        slug = json['slug'] as String?,
        quizCount = (json['quizCount'] as num?)?.toInt() ?? 0,
        tags = (json['tags'] as List?)
                ?.map((e) => e.toString())
                .toList(growable: false) ??
            const <String>[];
}
