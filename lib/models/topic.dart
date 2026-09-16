class Topic {
  const Topic({
    required this.id,
    required this.title,
    required this.file,
    required this.summary,
    required this.categoryId,
    required this.categoryTitle,
  });

  final String id;
  final String title;
  final String file;
  final String summary;
  final String categoryId;
  final String categoryTitle;

  factory Topic.fromJson(
    Map<String, dynamic> json, {
    required String categoryId,
    required String categoryTitle,
  }) {
    return Topic(
      id: json['id'] as String? ?? '',
      title: json['title'] as String? ?? 'Untitled',
      file: json['file'] as String? ?? '',
      summary: json['summary'] as String? ?? '',
      categoryId: categoryId,
      categoryTitle: categoryTitle,
    );
  }
}

class TopicCategory {
  const TopicCategory({
    required this.id,
    required this.title,
    required this.icon,
    required this.description,
    required this.topics,
  });

  final String id;
  final String title;
  final String icon;
  final String description;
  final List<Topic> topics;

  factory TopicCategory.fromJson(Map<String, dynamic> json) {
    final id = json['id'] as String? ?? '';
    final title = json['title'] as String? ?? '';
    final rawTopics = json['topics'] as List<dynamic>? ?? const <dynamic>[];
    return TopicCategory(
      id: id,
      title: title,
      icon: json['icon'] as String? ?? 'book',
      description: json['description'] as String? ?? '',
      topics: rawTopics
          .map(
            (topic) => Topic.fromJson(
              topic as Map<String, dynamic>,
              categoryId: id,
              categoryTitle: title,
            ),
          )
          .toList(growable: false),
    );
  }
}
