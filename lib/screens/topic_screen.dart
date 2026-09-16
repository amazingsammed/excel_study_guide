import 'package:flutter/material.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:get/get.dart';

import '../controllers/bookmark_controller.dart';
import '../controllers/content_controller.dart';
import '../models/topic.dart';

class TopicScreen extends StatefulWidget {
  const TopicScreen({
    super.key,
    required this.topics,
    required this.initialIndex,
  });

  final List<Topic> topics;
  final int initialIndex;

  @override
  State<TopicScreen> createState() => _TopicScreenState();
}

class _TopicScreenState extends State<TopicScreen> {
  final ScrollController _scrollController = ScrollController();
  final ContentController _content = Get.find<ContentController>();

  late int _index;
  late Future<String> _contentFuture;

  @override
  void initState() {
    super.initState();
    _index = widget.topics.isEmpty
        ? 0
        : widget.initialIndex.clamp(0, widget.topics.length - 1);
    _contentFuture = _content.loadMarkdown(_current.file);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Topic get _current => widget.topics[_index];

  void _goTo(int index) {
    if (index < 0 || index >= widget.topics.length) {
      return;
    }
    setState(() {
      _index = index;
      _contentFuture = _content.loadMarkdown(_current.file);
    });
    if (_scrollController.hasClients) {
      _scrollController.jumpTo(0);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bookmarks = Get.find<BookmarkController>();

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(_current.title),
            Text(
              _current.categoryTitle,
              style: theme.textTheme.labelSmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
        actions: [
          Obx(() {
            final saved = bookmarks.isBookmarked(_current.id);
            return IconButton(
              tooltip: saved ? 'Remove bookmark' : 'Add bookmark',
              icon: Icon(saved ? Icons.bookmark : Icons.bookmark_border),
              onPressed: () {
                bookmarks.toggle(_current);
                Get.snackbar(
                  saved ? 'Bookmark removed' : 'Bookmark added',
                  _current.title,
                  snackPosition: SnackPosition.BOTTOM,
                  duration: const Duration(seconds: 2),
                );
              },
            );
          }),
        ],
      ),
      body: FutureBuilder<String>(
        future: _contentFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('${snapshot.error}'));
          }
          return Markdown(
            controller: _scrollController,
            data: snapshot.data ?? '',
            selectable: true,
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
            styleSheet: _styleSheet(context),
            onTapLink: (text, href, title) {
              Get.snackbar(
                'External link',
                href ?? text,
                snackPosition: SnackPosition.BOTTOM,
              );
            },
          );
        },
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: _index > 0 ? () => _goTo(_index - 1) : null,
                  child: const Text('Previous'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: FilledButton(
                  onPressed: _index < widget.topics.length - 1
                      ? () => _goTo(_index + 1)
                      : null,
                  child: const Text('Next'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  MarkdownStyleSheet _styleSheet(BuildContext context) {
    final theme = Theme.of(context);
    final base = MarkdownStyleSheet.fromTheme(theme);
    return base.copyWith(
      h1: theme.textTheme.headlineMedium?.copyWith(
        fontWeight: FontWeight.bold,
        color: theme.colorScheme.primary,
      ),
      h2: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
      h3: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
      code: TextStyle(
        fontFamily: 'monospace',
        fontSize: 14,
        backgroundColor: theme.colorScheme.surfaceContainerHighest,
        color: theme.colorScheme.onSurface,
      ),
      codeblockDecoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(8),
      ),
      blockquoteDecoration: BoxDecoration(
        color: theme.colorScheme.secondaryContainer,
        border: Border(
          left: BorderSide(color: theme.colorScheme.primary, width: 4),
        ),
      ),
      tableBorder: TableBorder.all(color: theme.colorScheme.outlineVariant),
      tableHead: TextStyle(
        fontWeight: FontWeight.bold,
        color: theme.colorScheme.onSurface,
      ),
      tableCellsPadding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8,
      ),
    );
  }
}
