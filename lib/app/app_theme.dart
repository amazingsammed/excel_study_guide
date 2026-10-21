import 'package:flutter/material.dart';

/// Colour palette inspired by Duolingo's bright, playful design language.
class AppColors {
  AppColors._();

  // Brand colours.
  static const Color green = Color(0xFF58CC02);
  static const Color greenDark = Color(0xFF46A302);
  static const Color greenPale = Color(0xFFD7FFB8);
  static const Color greenInk = Color(0xFF2B5D00);
  static const Color blue = Color(0xFF1CB0F6);
  static const Color bluePale = Color(0xFFDDF4FF);
  static const Color blueInk = Color(0xFF0A5C80);
  static const Color yellow = Color(0xFFFFC800);
  static const Color yellowPale = Color(0xFFFFF4CC);
  static const Color yellowInk = Color(0xFF7A5B00);
  static const Color red = Color(0xFFFF4B4B);
  static const Color redPale = Color(0xFFFFDFE0);
  static const Color redInk = Color(0xFF8A1C1C);

  // Light theme neutrals.
  static const Color white = Color(0xFFFFFFFF);
  static const Color offWhite = Color(0xFFF7F7F7);
  static const Color ink = Color(0xFF3C3C3C);
  static const Color inkMuted = Color(0xFF777777);
  static const Color border = Color(0xFFE5E5E5);

  // Dark theme neutrals.
  static const Color darkBackground = Color(0xFF131F24);
  static const Color darkSurface = Color(0xFF1F2A30);
  static const Color darkBorder = Color(0xFF37464F);
  static const Color darkText = Color(0xFFF1F7FB);
  static const Color darkMuted = Color(0xFF9AAEB8);

  // Dark-theme brand tints.
  static const Color greenDarkTint = Color(0xFF263B1F);
  static const Color blueDarkTint = Color(0xFF14323D);
  static const Color yellowDarkTint = Color(0xFF3B3115);
  static const Color redDarkTint = Color(0xFF3B1E20);
}

class AppTheme {
  AppTheme._();

  static const Color seed = AppColors.green;

  static ThemeData light() => _build(Brightness.light);

  static ThemeData dark() => _build(Brightness.dark);

  static ThemeData _build(Brightness brightness) {
    final isDark = brightness == Brightness.dark;
    final scheme = _scheme(brightness);

    final baseTextTheme = ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      fontFamily: 'Nunito',
    ).textTheme;
    final textTheme = _textTheme(baseTextTheme);

    final buttonShape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(14),
    );
    final buttonTextStyle = textTheme.labelLarge?.copyWith(
      fontWeight: FontWeight.w800,
      letterSpacing: 0.4,
    );
    final buttonSize = const Size(64, 52);

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: scheme,
      fontFamily: 'Nunito',
      scaffoldBackgroundColor: isDark
          ? AppColors.darkBackground
          : AppColors.white,
      canvasColor: isDark ? AppColors.darkBackground : AppColors.white,
      dividerColor: scheme.outlineVariant,
      textTheme: textTheme,
      primaryTextTheme: textTheme,
      visualDensity: VisualDensity.standard,
      materialTapTargetSize: MaterialTapTargetSize.padded,
      applyElevationOverlayColor: false,
      appBarTheme: AppBarTheme(
        backgroundColor: scheme.surface,
        foregroundColor: scheme.onSurface,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        toolbarHeight: 60,
        iconTheme: IconThemeData(color: scheme.onSurface),
        actionsIconTheme: IconThemeData(color: scheme.onSurface),
        titleTextStyle: textTheme.titleLarge?.copyWith(
          color: scheme.onSurface,
          fontWeight: FontWeight.w800,
        ),
        shape: Border(
          bottom: BorderSide(color: scheme.outlineVariant, width: 2),
        ),
      ),
      cardTheme: CardThemeData(
        color: isDark ? AppColors.darkSurface : AppColors.white,
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.transparent,
        elevation: 0,
        margin: EdgeInsets.zero,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: scheme.outlineVariant, width: 2),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: scheme.primary,
          foregroundColor: scheme.onPrimary,
          disabledBackgroundColor: scheme.surfaceContainerHighest,
          disabledForegroundColor: scheme.onSurfaceVariant,
          minimumSize: buttonSize,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          textStyle: buttonTextStyle,
          shape: buttonShape,
          side: const BorderSide(color: AppColors.greenDark, width: 2),
          elevation: 0,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: scheme.primary,
          foregroundColor: scheme.onPrimary,
          disabledBackgroundColor: scheme.surfaceContainerHighest,
          disabledForegroundColor: scheme.onSurfaceVariant,
          minimumSize: buttonSize,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          textStyle: buttonTextStyle,
          shape: buttonShape,
          side: const BorderSide(color: AppColors.greenDark, width: 2),
          elevation: 0,
          shadowColor: Colors.transparent,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: scheme.secondary,
          disabledForegroundColor: scheme.onSurfaceVariant,
          backgroundColor: scheme.surface,
          minimumSize: buttonSize,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          textStyle: buttonTextStyle,
          shape: buttonShape,
          side: BorderSide(color: scheme.outline, width: 2),
          elevation: 0,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: scheme.secondary,
          textStyle: buttonTextStyle,
          minimumSize: const Size(48, 48),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          foregroundColor: scheme.onSurfaceVariant,
          highlightColor: scheme.primary.withValues(alpha: 0.12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationThemeData(
        filled: true,
        fillColor: scheme.surfaceContainerHighest,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        hintStyle: textTheme.bodyMedium?.copyWith(
          color: scheme.onSurfaceVariant,
        ),
        labelStyle: textTheme.bodyMedium?.copyWith(
          color: scheme.onSurfaceVariant,
          fontWeight: FontWeight.w700,
        ),
        prefixIconColor: scheme.onSurfaceVariant,
        suffixIconColor: scheme.onSurfaceVariant,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: scheme.outlineVariant, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: scheme.outlineVariant, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: scheme.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: scheme.error, width: 2),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: scheme.error, width: 2),
        ),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: scheme.surface,
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.transparent,
        elevation: 0,
        height: 72,
        indicatorColor: scheme.primary.withValues(alpha: 0.16),
        indicatorShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          final selected = states.contains(WidgetState.selected);
          return textTheme.labelSmall?.copyWith(
            color: selected ? scheme.primary : scheme.onSurfaceVariant,
            fontWeight: FontWeight.w800,
          );
        }),
        iconTheme: WidgetStateProperty.resolveWith((states) {
          final selected = states.contains(WidgetState.selected);
          return IconThemeData(
            color: selected ? scheme.primary : scheme.onSurfaceVariant,
            size: 26,
          );
        }),
      ),
      listTileTheme: ListTileThemeData(
        iconColor: scheme.primary,
        textColor: scheme.onSurface,
        titleTextStyle: textTheme.titleSmall?.copyWith(
          color: scheme.onSurface,
          fontWeight: FontWeight.w700,
        ),
        subtitleTextStyle: textTheme.bodySmall?.copyWith(
          color: scheme.onSurfaceVariant,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      ),
      dividerTheme: DividerThemeData(
        color: scheme.outlineVariant,
        thickness: 2,
        space: 24,
      ),
      chipTheme: ChipThemeData(
        backgroundColor: scheme.secondaryContainer,
        side: BorderSide.none,
        shape: const StadiumBorder(),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        labelStyle: textTheme.labelMedium?.copyWith(
          color: scheme.onSecondaryContainer,
          fontWeight: FontWeight.w800,
        ),
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: scheme.primary,
        linearTrackColor: scheme.outlineVariant,
        linearMinHeight: 8,
        borderRadius: BorderRadius.circular(8),
      ),
      sliderTheme: SliderThemeData(
        activeTrackColor: scheme.primary,
        inactiveTrackColor: scheme.outlineVariant,
        thumbColor: scheme.primary,
        overlayColor: scheme.primary.withValues(alpha: 0.14),
        trackHeight: 8,
        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10),
        overlayShape: const RoundSliderOverlayShape(overlayRadius: 20),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith(
          (states) => states.contains(WidgetState.selected)
              ? AppColors.white
              : scheme.onSurfaceVariant,
        ),
        trackColor: WidgetStateProperty.resolveWith(
          (states) => states.contains(WidgetState.selected)
              ? scheme.primary
              : scheme.outlineVariant,
        ),
        trackOutlineColor: WidgetStateProperty.all(scheme.outline),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith(
          (states) => states.contains(WidgetState.selected)
              ? scheme.primary
              : Colors.transparent,
        ),
        checkColor: WidgetStateProperty.all(AppColors.white),
        side: BorderSide(color: scheme.outline, width: 2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      ),
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith(
          (states) => states.contains(WidgetState.selected)
              ? scheme.primary
              : scheme.onSurfaceVariant,
        ),
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: scheme.inverseSurface,
        contentTextStyle: textTheme.bodyMedium?.copyWith(
          color: scheme.onInverseSurface,
          fontWeight: FontWeight.w700,
        ),
        actionTextColor: scheme.primary,
        insetPadding: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: isDark ? AppColors.darkSurface : AppColors.white,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: scheme.outlineVariant, width: 2),
        ),
        titleTextStyle: textTheme.titleLarge?.copyWith(
          color: scheme.onSurface,
          fontWeight: FontWeight.w800,
        ),
        contentTextStyle: textTheme.bodyMedium?.copyWith(
          color: scheme.onSurfaceVariant,
        ),
      ),
      segmentedButtonTheme: SegmentedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith(
            (states) => states.contains(WidgetState.selected)
                ? scheme.primaryContainer
                : scheme.surface,
          ),
          foregroundColor: WidgetStateProperty.resolveWith(
            (states) => states.contains(WidgetState.selected)
                ? scheme.onPrimaryContainer
                : scheme.onSurfaceVariant,
          ),
          textStyle: WidgetStateProperty.all(
            textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w800),
          ),
          side: WidgetStateProperty.all(
            BorderSide(color: scheme.outlineVariant, width: 2),
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          minimumSize: const WidgetStatePropertyAll(Size(0, 48)),
        ),
      ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: scheme.primary,
        selectionColor: scheme.primary.withValues(alpha: 0.3),
        selectionHandleColor: scheme.primary,
      ),
      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
          color: scheme.inverseSurface,
          borderRadius: BorderRadius.circular(8),
        ),
        textStyle: textTheme.labelMedium?.copyWith(
          color: scheme.onInverseSurface,
        ),
      ),
      scrollbarTheme: ScrollbarThemeData(
        thickness: const WidgetStatePropertyAll(6),
        radius: const Radius.circular(8),
        thumbColor: WidgetStatePropertyAll(
          scheme.onSurfaceVariant.withValues(alpha: 0.4),
        ),
      ),
    );
  }

  static ColorScheme _scheme(Brightness brightness) {
    final isDark = brightness == Brightness.dark;
    final base = ColorScheme.fromSeed(
      seedColor: AppColors.green,
      brightness: brightness,
    );

    if (isDark) {
      return base.copyWith(
        primary: AppColors.green,
        onPrimary: AppColors.white,
        primaryContainer: AppColors.greenDarkTint,
        onPrimaryContainer: AppColors.greenPale,
        secondary: AppColors.blue,
        onSecondary: AppColors.white,
        secondaryContainer: AppColors.blueDarkTint,
        onSecondaryContainer: AppColors.bluePale,
        tertiary: AppColors.yellow,
        onTertiary: AppColors.darkBackground,
        tertiaryContainer: AppColors.yellowDarkTint,
        onTertiaryContainer: AppColors.yellowPale,
        error: AppColors.red,
        onError: AppColors.white,
        errorContainer: AppColors.redDarkTint,
        onErrorContainer: AppColors.redPale,
        surface: AppColors.darkBackground,
        onSurface: AppColors.darkText,
        onSurfaceVariant: AppColors.darkMuted,
        surfaceContainerHighest: AppColors.darkSurface,
        surfaceContainerHigh: AppColors.darkSurface,
        surfaceContainer: AppColors.darkSurface,
        outline: AppColors.darkBorder,
        outlineVariant: AppColors.darkBorder,
        surfaceTint: Colors.transparent,
        inverseSurface: AppColors.darkText,
        onInverseSurface: AppColors.darkBackground,
      );
    }

    return base.copyWith(
      primary: AppColors.green,
      onPrimary: AppColors.white,
      primaryContainer: AppColors.greenPale,
      onPrimaryContainer: AppColors.greenInk,
      secondary: AppColors.blue,
      onSecondary: AppColors.white,
      secondaryContainer: AppColors.bluePale,
      onSecondaryContainer: AppColors.blueInk,
      tertiary: AppColors.yellow,
      onTertiary: AppColors.ink,
      tertiaryContainer: AppColors.yellowPale,
      onTertiaryContainer: AppColors.yellowInk,
      error: AppColors.red,
      onError: AppColors.white,
      errorContainer: AppColors.redPale,
      onErrorContainer: AppColors.redInk,
      surface: AppColors.white,
      onSurface: AppColors.ink,
      onSurfaceVariant: AppColors.inkMuted,
      surfaceContainerHighest: AppColors.offWhite,
      surfaceContainerHigh: AppColors.offWhite,
      surfaceContainer: AppColors.offWhite,
      outline: AppColors.border,
      outlineVariant: AppColors.border,
      surfaceTint: Colors.transparent,
      inverseSurface: AppColors.ink,
      onInverseSurface: AppColors.white,
    );
  }

  static TextTheme _textTheme(TextTheme base) {
    TextStyle? heavy(TextStyle? style, FontWeight weight) =>
        style?.copyWith(fontWeight: weight, letterSpacing: 0);

    return base.copyWith(
      displayLarge: heavy(base.displayLarge, FontWeight.w800),
      displayMedium: heavy(base.displayMedium, FontWeight.w800),
      displaySmall: heavy(base.displaySmall, FontWeight.w800),
      headlineLarge: heavy(base.headlineLarge, FontWeight.w800),
      headlineMedium: heavy(base.headlineMedium, FontWeight.w800),
      headlineSmall: heavy(base.headlineSmall, FontWeight.w800),
      titleLarge: heavy(base.titleLarge, FontWeight.w800),
      titleMedium: heavy(base.titleMedium, FontWeight.w800),
      titleSmall: heavy(base.titleSmall, FontWeight.w800),
      bodyLarge: heavy(base.bodyLarge, FontWeight.w600),
      bodyMedium: heavy(base.bodyMedium, FontWeight.w600),
      bodySmall: heavy(base.bodySmall, FontWeight.w600),
      labelLarge: heavy(
        base.labelLarge,
        FontWeight.w800,
      )?.copyWith(letterSpacing: 0.4),
      labelMedium: heavy(base.labelMedium, FontWeight.w700),
      labelSmall: heavy(base.labelSmall, FontWeight.w700),
    );
  }
}
