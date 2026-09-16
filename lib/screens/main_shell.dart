import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

  @override
  Widget build(BuildContext context) {
    final shell = Get.find<ShellController>();
    return Obx(
      () => Scaffold(
        body: IndexedStack(index: shell.index.value, children: _screens),
        bottomNavigationBar: NavigationBar(
          selectedIndex: shell.index.value,
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
    );
  }
}
