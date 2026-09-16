import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/app_theme.dart';
import 'controllers/bookmark_controller.dart';
import 'controllers/content_controller.dart';
import 'controllers/quiz_controller.dart';
import 'controllers/settings_controller.dart';
import 'controllers/shell_controller.dart';
import 'data/app_database.dart';
import 'data/bookmark_repository.dart';
import 'screens/main_shell.dart';
import 'screens/onboarding_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppDatabase.initFactory();

  final settings = SettingsController();
  await settings.load();
  Get.put(settings, permanent: true);
  Get.put(ContentController(), permanent: true);
  Get.put(QuizController(), permanent: true);
  Get.put(ShellController(), permanent: true);
  Get.put<BookmarkController>(
    BookmarkController(SqliteBookmarkRepository()),
    permanent: true,
  );

  runApp(const ExcelStudyGuideApp());
}

class ExcelStudyGuideApp extends StatelessWidget {
  const ExcelStudyGuideApp({super.key});

  @override
  Widget build(BuildContext context) {
    final settings = Get.find<SettingsController>();
    final showOnboarding = !settings.onboardingComplete.value;
    return Obx(
      () => GetMaterialApp(
        title: 'Excel Study Guide',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light(),
        darkTheme: AppTheme.dark(),
        themeMode: settings.themeMode.value,
        builder: (context, child) {
          final media = MediaQuery.of(context);
          return MediaQuery(
            data: media.copyWith(
              textScaler: TextScaler.linear(settings.textScale.value),
            ),
            child: child ?? const SizedBox.shrink(),
          );
        },
        home: showOnboarding ? const OnboardingScreen() : const MainShell(),
      ),
    );
  }
}
