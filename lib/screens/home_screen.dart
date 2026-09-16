import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../app/category_icons.dart';
import '../controllers/bookmark_controller.dart';
import '../controllers/content_controller.dart';
import '../controllers/shell_controller.dart';
import '../widgets/empty_state.dart';
import '../widgets/topic_tile.dart';
import 'category_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final content = Get.find<ContentController>();
    final bookmarks = Get.find<BookmarkController>();
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Excel Study Guide')),
      body: Obx(() {
        if (content.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (content.error.value != null) {
          return EmptyState(
            icon: Icons.error_outline,
            title: 'Could not load content',
            message: content.error.value,
          );
        }

        final searching = content.query.value.trim().isNotEmpty;
        final results = content.searchResults;

        return ListView(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
          children: [
            _HeaderCard(
              topicCount: content.topicCount,
              categoryCount: content.categories.length,
              bookmarkCount: bookmarks.bookmarks.length,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _searchController,
              onChanged: content.setQuery,
              decoration: InputDecoration(
                hintText: 'Search topics and functions',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: searching
                    ? IconButton(
                        tooltip: 'Clear',
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          _searchController.clear();
                          content.setQuery('');
                        },
                      )
                    : null,
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            if (searching) ...[
              Text(
                '${results.length} result(s)',
                style: theme.textTheme.labelLarge,
              ),
              const SizedBox(height: 8),
              if (results.isEmpty)
                const EmptyState(
                  imageAsset: 'assets/images/empty_search.svg',
                  title: 'No topics match your search',
                  message: 'Try a different keyword, or browse the categories.',
                )
              else
                ...results.map(
                  (topic) => TopicTile(topic: topic, showCategory: true),
                ),
            ] else ...[
              _QuizCard(
                onTap: () =>
                    Get.find<ShellController>().goTo(ShellController.quizIndex),
              ),
              const SizedBox(height: 20),
              Text(
                'Browse categories',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              ...content.categories.map(
                (category) => Card(
                  clipBehavior: Clip.antiAlias,
                  margin: const EdgeInsets.only(bottom: 8),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: theme.colorScheme.primaryContainer,
                      foregroundColor: theme.colorScheme.onPrimaryContainer,
                      child: Icon(categoryIcon(category.icon)),
                    ),
                    title: Text(category.title),
                    subtitle: Text(category.description),
                    trailing: Text(
                      '${category.topics.length}',
                      style: theme.textTheme.labelLarge,
                    ),
                    onTap: () => Get.to<void>(
                      () => CategoryScreen(categoryId: category.id),
                    ),
                  ),
                ),
              ),
            ],
          ],
        );
      }),
    );
  }
}

class _HeaderCard extends StatelessWidget {
  const _HeaderCard({
    required this.topicCount,
    required this.categoryCount,
    required this.bookmarkCount,
  });

  final int topicCount;
  final int categoryCount;
  final int bookmarkCount;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final onPrimary = theme.colorScheme.onPrimary;
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: <Color>[
            theme.colorScheme.primary,
            theme.colorScheme.primary.withValues(alpha: 0.72),
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Learn Excel offline',
                      style: theme.textTheme.titleLarge?.copyWith(
                        color: onPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'A complete study guide, ready anytime, anywhere.',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: onPrimary.withValues(alpha: 0.9),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              SvgPicture.asset(
                'assets/images/home_hero.svg',
                width: 92,
                fit: BoxFit.contain,
              ),
            ],
          ),
          const SizedBox(height: 18),
          Row(
            children: [
              _Stat(value: '$topicCount', label: 'Topics', color: onPrimary),
              _Stat(
                value: '$categoryCount',
                label: 'Categories',
                color: onPrimary,
              ),
              _Stat(
                value: '$bookmarkCount',
                label: 'Bookmarks',
                color: onPrimary,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Stat extends StatelessWidget {
  const _Stat({required this.value, required this.label, required this.color});

  final String value;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            value,
            style: theme.textTheme.titleLarge?.copyWith(
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            label,
            style: theme.textTheme.labelSmall?.copyWith(
              color: color.withValues(alpha: 0.85),
            ),
          ),
        ],
      ),
    );
  }
}

class _QuizCard extends StatelessWidget {
  const _QuizCard({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    return Card(
      clipBehavior: Clip.antiAlias,
      color: scheme.secondaryContainer,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Icon(Icons.quiz_outlined, color: scheme.onSecondaryContainer),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Test your knowledge',
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: scheme.onSecondaryContainer,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Pick a level and track your best score.',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: scheme.onSecondaryContainer,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(Icons.chevron_right, color: scheme.onSecondaryContainer),
            ],
          ),
        ),
      ),
    );
  }
}
