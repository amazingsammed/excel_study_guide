import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app/navigation.dart';
import '../controllers/bookmark_controller.dart';
import '../models/topic.dart';

class TopicTile extends StatelessWidget {
  const TopicTile({
    super.key,
    required this.topic,
    this.showCategory = false,
    this.onTap,
  });

  final Topic topic;
  final bool showCategory;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final bookmarks = Get.find<BookmarkController>();
    return ListTile(
      title: Text(topic.title),
      subtitle: _buildSubtitle(context),
      onTap: onTap ?? () => openTopic(topic),
      trailing: Obx(() {
        final saved = bookmarks.isBookmarked(topic.id);
        return IconButton(
          tooltip: saved ? 'Remove bookmark' : 'Add bookmark',
          icon: Icon(saved ? Icons.bookmark : Icons.bookmark_border),
          color: saved ? Theme.of(context).colorScheme.primary : null,
          onPressed: () => bookmarks.toggle(topic),
        );
      }),
    );
  }

  Widget? _buildSubtitle(BuildContext context) {
    if (showCategory) {
      return Text(topic.categoryTitle);
    }
    if (topic.summary.isEmpty) {
      return null;
    }
    return Text(topic.summary, maxLines: 2, overflow: TextOverflow.ellipsis);
  }
}
