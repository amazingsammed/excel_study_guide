import 'package:get/get.dart';

import '../data/content_repository.dart';
import '../models/topic.dart';

class ContentController extends GetxController {
  ContentController({ContentRepository? repository})
    : _repository = repository ?? ContentRepository();

  final ContentRepository _repository;

  final RxList<TopicCategory> categories = <TopicCategory>[].obs;
  final RxBool isLoading = true.obs;
  final RxnString error = RxnString();
  final RxString query = ''.obs;

  List<Topic> get allTopics =>
      categories.expand((category) => category.topics).toList(growable: false);

  int get topicCount => allTopics.length;

  List<Topic> get searchResults {
    final q = query.value.trim().toLowerCase();
    if (q.isEmpty) {
      return const <Topic>[];
    }
    return allTopics
        .where(
          (topic) =>
              topic.title.toLowerCase().contains(q) ||
              topic.summary.toLowerCase().contains(q) ||
              topic.categoryTitle.toLowerCase().contains(q),
        )
        .toList(growable: false);
  }

  Topic? topicById(String id) {
    for (final category in categories) {
      for (final topic in category.topics) {
        if (topic.id == id) {
          return topic;
        }
      }
    }
    return null;
  }

  TopicCategory? categoryById(String id) {
    for (final category in categories) {
      if (category.id == id) {
        return category;
      }
    }
    return null;
  }

  Future<String> loadMarkdown(String file) => _repository.loadMarkdown(file);

  @override
  void onInit() {
    super.onInit();
    load();
  }

  Future<void> load() async {
    isLoading.value = true;
    error.value = null;
    try {
      categories.assignAll(await _repository.loadCategories());
    } catch (exception) {
      error.value = exception.toString();
    } finally {
      isLoading.value = false;
    }
  }

  void setQuery(String value) => query.value = value;
}
