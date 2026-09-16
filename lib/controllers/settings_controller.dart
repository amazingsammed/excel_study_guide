import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsController extends GetxController {
  static const String _themeKey = 'theme_mode';
  static const String _textScaleKey = 'text_scale';
  static const String _onboardingKey = 'onboarding_complete';

  final Rx<ThemeMode> themeMode = ThemeMode.system.obs;
  final RxDouble textScale = 1.0.obs;
  final RxBool onboardingComplete = false.obs;

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    final storedTheme = prefs.getInt(_themeKey);
    if (storedTheme != null &&
        storedTheme >= 0 &&
        storedTheme < ThemeMode.values.length) {
      themeMode.value = ThemeMode.values[storedTheme];
    }
    textScale.value = prefs.getDouble(_textScaleKey) ?? 1.0;
    onboardingComplete.value = prefs.getBool(_onboardingKey) ?? false;
  }

  Future<void> completeOnboarding() async {
    onboardingComplete.value = true;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_onboardingKey, true);
  }

  Future<void> resetOnboarding() async {
    onboardingComplete.value = false;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_onboardingKey, false);
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    themeMode.value = mode;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_themeKey, mode.index);
  }

  Future<void> setTextScale(double scale) async {
    textScale.value = scale;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(_textScaleKey, scale);
  }
}
