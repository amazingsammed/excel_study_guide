class Bookmark {
  const Bookmark({
    required this.topicId,
    required this.title,
    required this.category,
    required this.file,
    required this.createdAt,
  });

  final String topicId;
  final String title;
  final String category;
  final String file;
  final DateTime createdAt;

  Map<String, Object?> toMap() {
    return <String, Object?>{
      'topic_id': topicId,
      'title': title,
      'category': category,
      'file': file,
      'created_at': createdAt.millisecondsSinceEpoch,
    };
  }

  factory Bookmark.fromMap(Map<String, Object?> map) {
    return Bookmark(
      topicId: map['topic_id'] as String,
      title: map['title'] as String,
      category: map['category'] as String,
      file: map['file'] as String,
      createdAt: DateTime.fromMillisecondsSinceEpoch(
        (map['created_at'] as int?) ?? 0,
      ),
    );
  }
}
