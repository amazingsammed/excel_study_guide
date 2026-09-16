import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app/navigation.dart';
import '../controllers/bookmark_controller.dart';
import '../widgets/empty_state.dart';

class BookmarksScreen extends StatelessWidget {
  const BookmarksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bookmarks = Get.find<BookmarkController>();
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Bookmarked')),
      body: Obx(() {
        if (bookmarks.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        final items = bookmarks.bookmarks;
        if (items.isEmpty) {
          return const EmptyState(
            imageAsset: 'assets/images/empty_bookmarks.svg',
            title: 'No bookmarks yet',
            message:
                'Tap the bookmark icon on any topic to save it here for quick access.',
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.only(bottom: 24),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final bookmark = items[index];
            return Dismissible(
              key: ValueKey<String>(bookmark.topicId),
              direction: DismissDirection.endToStart,
              background: Container(
                color: theme.colorScheme.errorContainer,
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Icon(
                  Icons.delete,
                  color: theme.colorScheme.onErrorContainer,
                ),
              ),
              onDismissed: (_) {
                bookmarks.remove(bookmark.topicId);
                Get.snackbar(
                  'Bookmark removed',
                  bookmark.title,
                  snackPosition: SnackPosition.BOTTOM,
                );
              },
              child: ListTile(
                leading: Icon(Icons.bookmark, color: theme.colorScheme.primary),
                title: Text(bookmark.title),
                subtitle: Text(bookmark.category),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => openBookmark(bookmark),
              ),
            );
          },
        );
      }),
    );
  }
}
