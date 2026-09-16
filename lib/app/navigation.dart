import 'package:get/get.dart';

import '../controllers/content_controller.dart';
import '../models/bookmark.dart';
import '../models/topic.dart';
import '../screens/topic_screen.dart';

/// Opens a topic in the reader, wiring up previous/next navigation using the
/// full ordered topic list from the manifest.
void openTopic(Topic topic) {
  final content = Get.find<ContentController>();
  final topics = content.allTopics;
  final index = topics.indexWhere((item) => item.id == topic.id);
  Get.to<void>(
    () => TopicScreen(topics: topics, initialIndex: index < 0 ? 0 : index),
  );
}

/// Opens a bookmarked topic. If the topic still exists in the manifest the full
/// reading order is used, otherwise it falls back to a single-topic reader.
void openBookmark(Bookmark bookmark) {
  final content = Get.find<ContentController>();
  final topics = content.allTopics;
  final index = topics.indexWhere((item) => item.id == bookmark.topicId);
  if (index >= 0) {
    Get.to<void>(() => TopicScreen(topics: topics, initialIndex: index));
    return;
  }
  final topic = Topic(
    id: bookmark.topicId,
    title: bookmark.title,
    file: bookmark.file,
    summary: '',
    categoryId: '',
    categoryTitle: bookmark.category,
  );
  Get.to<void>(() => TopicScreen(topics: <Topic>[topic], initialIndex: 0));
}
