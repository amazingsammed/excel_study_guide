import 'package:get/get.dart';

/// Controls which bottom navigation tab is visible so any screen can switch
/// tabs (for example, a Home card jumping to the Quiz).
class ShellController extends GetxController {
  static const int homeIndex = 0;
  static const int quizIndex = 1;
  static const int bookmarksIndex = 2;
  static const int settingsIndex = 3;

  final RxInt index = RxInt(homeIndex);

  void goTo(int value) => index.value = value;
}
