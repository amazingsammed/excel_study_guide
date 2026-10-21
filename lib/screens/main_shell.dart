import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../ads/ad_ids.dart';
import '../ads/banner_ad_slot.dart';
import '../controllers/shell_controller.dart';
import 'bookmarks_screen.dart';
import 'home_screen.dart';
import 'quiz_screen.dart';
import 'settings_screen.dart';

class MainShell extends StatelessWidget {
  const MainShell({super.key});

  static const List<Widget> _screens = <Widget>[
    HomeScreen(),
    QuizScreen(),
    BookmarksScreen(),
    SettingsScreen(),
  ];

  static AdUnitIds _bannerFor(int index) {
    switch (index) {
      case ShellController.quizIndex:
        return AdIds.quizBanner;
      case ShellController.bookmarksIndex:
        return AdIds.bookmarksBanner;
      case ShellController.settingsIndex:
        return AdIds.settingsBanner;
      default:
        return AdIds.homeBanner;
    }
  }

  @override
  Widget build(BuildContext context) {
    final shell = Get.find<ShellController>();
    final theme = Theme.of(context);
    // Keep a single banner mounted at a time. Native ad views from a route
    // underneath the top route can otherwise keep drawing over the screen.
    final isTopRoute = ModalRoute.of(context)?.isCurrent ?? true;
    return Obx(() {
      final index = shell.index.value;
      return Scaffold(
        body: IndexedStack(index: index, children: _screens),
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isTopRoute)
              BannerAdSlot(key: ValueKey<int>(index), ids: _bannerFor(index)),
            DecoratedBox(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: theme.colorScheme.outlineVariant,
                    width: 2,
                  ),
                ),
              ),
              child: NavigationBar(
                selectedIndex: index,
                onDestinationSelected: shell.goTo,
                destinations: const <NavigationDestination>[
                  NavigationDestination(
                    icon: Icon(Icons.home_outlined),
                    selectedIcon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.quiz_outlined),
                    selectedIcon: Icon(Icons.quiz),
                    label: 'Quiz',
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.bookmark_border),
                    selectedIcon: Icon(Icons.bookmark),
                    label: 'Bookmarked',
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.settings_outlined),
                    selectedIcon: Icon(Icons.settings),
                    label: 'Settings',
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
