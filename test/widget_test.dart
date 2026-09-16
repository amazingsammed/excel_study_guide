import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:excel_study_guide/controllers/bookmark_controller.dart';
import 'package:excel_study_guide/controllers/content_controller.dart';
import 'package:excel_study_guide/controllers/quiz_controller.dart';
import 'package:excel_study_guide/controllers/settings_controller.dart';
import 'package:excel_study_guide/controllers/shell_controller.dart';
import 'package:excel_study_guide/data/bookmark_repository.dart';
import 'package:excel_study_guide/main.dart';
import 'package:excel_study_guide/models/topic.dart';

Future<void> registerControllers({bool onboarded = true}) async {
  Get.testMode = true;
  Get.reset();
  SharedPreferences.setMockInitialValues(<String, Object>{
    'onboarding_complete': onboarded,
  });

  final settings = SettingsController();
  await settings.load();
  Get.put(settings);

  final content = ContentController();
  Get.put(content);
  await content.load();

  final quiz = QuizController();
  Get.put(quiz);
  await quiz.load();

  Get.put(ShellController());

  final bookmarks = BookmarkController(InMemoryBookmarkRepository());
  Get.put(bookmarks);
  await bookmarks.load();
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  tearDown(Get.reset);

  testWidgets('shows the four bottom navigation destinations', (tester) async {
    await registerControllers();

    await tester.pumpWidget(const ExcelStudyGuideApp());
    await tester.pumpAndSettle();

    final navBar = find.byType(NavigationBar);
    expect(navBar, findsOneWidget);

    for (final label in <String>['Home', 'Quiz', 'Bookmarked', 'Settings']) {
      expect(
        find.descendant(of: navBar, matching: find.text(label)),
        findsOneWidget,
      );
    }
  });

  testWidgets('quiz tab lists levels and gives feedback in a level', (
    tester,
  ) async {
    await registerControllers();

    await tester.pumpWidget(const ExcelStudyGuideApp());
    await tester.pumpAndSettle();

    await tester.tap(
      find.descendant(
        of: find.byType(NavigationBar),
        matching: find.text('Quiz'),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Choose a level'), findsOneWidget);
    expect(find.text('Beginner'), findsOneWidget);
    expect(find.text('Intermediate'), findsOneWidget);
    expect(find.text('Advanced'), findsOneWidget);

    await tester.tap(find.text('Beginner'));
    await tester.pumpAndSettle();

    expect(find.textContaining('Question 1 of'), findsOneWidget);

    await tester.tap(find.text('=').first);
    await tester.pumpAndSettle();

    expect(find.text('Correct!'), findsOneWidget);
  });

  testWidgets('first launch shows onboarding and can be skipped', (
    tester,
  ) async {
    await registerControllers(onboarded: false);

    await tester.pumpWidget(const ExcelStudyGuideApp());
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 300));

    expect(find.text('Learn Excel offline'), findsOneWidget);
    expect(find.text('Skip'), findsOneWidget);

    await tester.tap(find.text('Skip'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 400));
    await tester.pump(const Duration(seconds: 1));

    expect(find.byType(NavigationBar), findsOneWidget);
    expect(find.text('Browse categories'), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsNothing);
  });

  test('bookmark controller adds, detects and removes bookmarks', () async {
    final controller = BookmarkController(InMemoryBookmarkRepository());
    await controller.load();

    const topic = Topic(
      id: 'sum',
      title: 'SUM',
      file: 'functions/01_sum.md',
      summary: 'Add values together.',
      categoryId: 'functions',
      categoryTitle: 'Functions',
    );

    await controller.toggle(topic);
    expect(controller.isBookmarked('sum'), isTrue);
    expect(controller.bookmarks.length, 1);

    await controller.toggle(topic);
    expect(controller.isBookmarked('sum'), isFalse);
    expect(controller.bookmarks, isEmpty);
  });
}
