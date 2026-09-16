import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/bookmark_controller.dart';
import '../controllers/quiz_controller.dart';
import '../controllers/settings_controller.dart';
import 'onboarding_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final settings = Get.find<SettingsController>();
    final bookmarks = Get.find<BookmarkController>();
    final quiz = Get.find<QuizController>();
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        padding: const EdgeInsets.only(bottom: 24),
        children: [
          _SectionHeader(title: 'Appearance'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Obx(
              () => SegmentedButton<ThemeMode>(
                showSelectedIcon: false,
                segments: const <ButtonSegment<ThemeMode>>[
                  ButtonSegment<ThemeMode>(
                    value: ThemeMode.system,
                    label: Text('System'),
                  ),
                  ButtonSegment<ThemeMode>(
                    value: ThemeMode.light,
                    label: Text('Light'),
                  ),
                  ButtonSegment<ThemeMode>(
                    value: ThemeMode.dark,
                    label: Text('Dark'),
                  ),
                ],
                selected: <ThemeMode>{settings.themeMode.value},
                onSelectionChanged: (selection) =>
                    settings.setThemeMode(selection.first),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Obx(
            () => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Text size', style: theme.textTheme.titleSmall),
                  Row(
                    children: [
                      const Text('A', style: TextStyle(fontSize: 12)),
                      Expanded(
                        child: Slider(
                          value: settings.textScale.value,
                          min: 0.8,
                          max: 1.4,
                          divisions: 6,
                          label: '${(settings.textScale.value * 100).round()}%',
                          onChanged: settings.setTextScale,
                        ),
                      ),
                      const Text('A', style: TextStyle(fontSize: 20)),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const Divider(height: 32),
          _SectionHeader(title: 'Data'),
          Obx(
            () => ListTile(
              leading: const Icon(Icons.delete_outline),
              title: const Text('Clear all bookmarks'),
              subtitle: Text('${bookmarks.bookmarks.length} saved'),
              onTap: () => _confirmClear(context, bookmarks),
            ),
          ),
          Obx(
            () => ListTile(
              leading: const Icon(Icons.cleaning_services_outlined),
              title: const Text('Clear quiz scores'),
              subtitle: Text('${quiz.bestScores.length} level(s) attempted'),
              onTap: () => _confirmClearScores(context, quiz),
            ),
          ),
          const Divider(height: 32),
          _SectionHeader(title: 'Getting started'),
          ListTile(
            leading: const Icon(Icons.auto_awesome_outlined),
            title: const Text('Replay introduction'),
            subtitle: const Text('Show the onboarding slides again'),
            onTap: () async {
              await settings.resetOnboarding();
              Get.offAll<void>(() => const OnboardingScreen());
            },
          ),
          const Divider(height: 32),
          _SectionHeader(title: 'About'),
          const ListTile(
            leading: Icon(Icons.offline_bolt_outlined),
            title: Text('Offline'),
            subtitle: Text('All study content is bundled with the app.'),
          ),
          const ListTile(
            leading: Icon(Icons.palette_outlined),
            title: Text('Illustrations'),
            subtitle: Text('Cartoon illustrations from unDraw, free to use.'),
          ),
          const ListTile(
            leading: Icon(Icons.info_outline),
            title: Text('Version'),
            subtitle: Text('1.0.0'),
          ),
        ],
      ),
    );
  }

  Future<void> _confirmClear(
    BuildContext context,
    BookmarkController bookmarks,
  ) async {
    if (bookmarks.bookmarks.isEmpty) {
      Get.snackbar(
        'Nothing to clear',
        'You have no saved bookmarks.',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }
    final confirmed = await Get.dialog<bool>(
      AlertDialog(
        title: const Text('Clear all bookmarks?'),
        content: const Text(
          'This removes every saved bookmark from the device. This cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back<bool>(result: false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Get.back<bool>(result: true),
            child: const Text('Clear'),
          ),
        ],
      ),
    );
    if (confirmed ?? false) {
      await bookmarks.clear();
      Get.snackbar(
        'Bookmarks cleared',
        'All bookmarks have been removed.',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> _confirmClearScores(
    BuildContext context,
    QuizController quiz,
  ) async {
    if (quiz.bestScores.isEmpty) {
      Get.snackbar(
        'Nothing to clear',
        'You have not completed any quiz level yet.',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }
    final confirmed = await Get.dialog<bool>(
      AlertDialog(
        title: const Text('Clear quiz scores?'),
        content: const Text(
          'This removes your best score for every level from the device. This cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back<bool>(result: false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Get.back<bool>(result: true),
            child: const Text('Clear'),
          ),
        ],
      ),
    );
    if (confirmed ?? false) {
      await quiz.clearScores();
      Get.snackbar(
        'Quiz scores cleared',
        'Your level scores have been removed.',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 8),
      child: Text(
        title,
        style: theme.textTheme.titleSmall?.copyWith(
          color: theme.colorScheme.primary,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
