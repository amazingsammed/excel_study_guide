import 'package:get/get.dart';

import '../data/bookmark_repository.dart';
import '../models/bookmark.dart';
import '../models/topic.dart';

class BookmarkController extends GetxController {
  BookmarkController(this._repository);

  final BookmarkRepository _repository;

  final RxList<Bookmark> bookmarks = <Bookmark>[].obs;
  final RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    load();
  }

  Future<void> load() async {
    isLoading.value = true;
    try {
      bookmarks.assignAll(await _repository.getAll());
    } finally {
      isLoading.value = false;
    }
  }

  bool isBookmarked(String topicId) =>
      bookmarks.any((bookmark) => bookmark.topicId == topicId);

  Future<void> toggle(Topic topic) async {
    if (isBookmarked(topic.id)) {
      await remove(topic.id);
      return;
    }
    final bookmark = Bookmark(
      topicId: topic.id,
      title: topic.title,
      category: topic.categoryTitle,
      file: topic.file,
      createdAt: DateTime.now(),
    );
    await _repository.add(bookmark);
    bookmarks.insert(0, bookmark);
  }

  Future<void> remove(String topicId) async {
    await _repository.remove(topicId);
    bookmarks.removeWhere((bookmark) => bookmark.topicId == topicId);
  }

  Future<void> clear() async {
    await _repository.clear();
    bookmarks.clear();
  }
}
