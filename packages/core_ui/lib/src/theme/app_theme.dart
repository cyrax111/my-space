import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_text_styles.dart';

/// Application theme configuration.
///
/// Provides both light and dark [ThemeData] built from design tokens.
/// Uses Material 3 with custom color scheme seeds.
abstract final class AppTheme {
  // ─── Light Theme ──────────────────────────────────────

  static ThemeData get lightTheme => ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorScheme: const ColorScheme.light(
          primary: AppColors.primary,
          onPrimary: Colors.white,
          primaryContainer: AppColors.primaryLight,
          secondary: AppColors.secondary,
          onSecondary: Colors.white,
          secondaryContainer: AppColors.secondaryLight,
          surface: AppColors.surfaceLight,
          onSurface: AppColors.textPrimaryLight,
          error: AppColors.error,
          onError: Colors.white,
          outline: AppColors.dividerLight,
        ),
        scaffoldBackgroundColor: AppColors.backgroundLight,
        cardColor: AppColors.cardLight,
        dividerColor: AppColors.dividerLight,
        textTheme: _textTheme(AppColors.textPrimaryLight),
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.surfaceLight,
          foregroundColor: AppColors.textPrimaryLight,
          elevation: 0,
          scrolledUnderElevation: 1,
          centerTitle: false,
        ),
        cardTheme: CardTheme(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(color: AppColors.dividerLight.withValues(alpha: 0.5)),
          ),
          color: AppColors.cardLight,
        ),
        navigationBarTheme: const NavigationBarThemeData(
          backgroundColor: AppColors.surfaceLight,
          indicatorColor: AppColors.primaryLight,
          elevation: 2,
        ),
        navigationRailTheme: NavigationRailThemeData(
          backgroundColor: AppColors.surfaceLight,
          indicatorColor: AppColors.primaryLight.withValues(alpha: 0.3),
          elevation: 0,
        ),
        chipTheme: ChipThemeData(
          backgroundColor: AppColors.backgroundLight,
          selectedColor: AppColors.primaryLight.withValues(alpha: 0.2),
          labelStyle: AppTextStyles.labelMedium,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppColors.surfaceLight,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.dividerLight),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.dividerLight),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.primary, width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.error),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      );

  // ─── Dark Theme ───────────────────────────────────────

  static ThemeData get darkTheme => ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: const ColorScheme.dark(
          primary: AppColors.primaryLight,
          onPrimary: Colors.black,
          primaryContainer: AppColors.primaryDark,
          secondary: AppColors.secondaryLight,
          onSecondary: Colors.black,
          secondaryContainer: AppColors.secondaryDark,
          surface: AppColors.surfaceDark,
          onSurface: AppColors.textPrimaryDark,
          error: AppColors.error,
          onError: Colors.white,
          outline: AppColors.dividerDark,
        ),
        scaffoldBackgroundColor: AppColors.backgroundDark,
        cardColor: AppColors.cardDark,
        dividerColor: AppColors.dividerDark,
        textTheme: _textTheme(AppColors.textPrimaryDark),
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.surfaceDark,
          foregroundColor: AppColors.textPrimaryDark,
          elevation: 0,
          scrolledUnderElevation: 1,
          centerTitle: false,
        ),
        cardTheme: CardTheme(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(color: AppColors.dividerDark.withValues(alpha: 0.5)),
          ),
          color: AppColors.cardDark,
        ),
        navigationBarTheme: const NavigationBarThemeData(
          backgroundColor: AppColors.surfaceDark,
          indicatorColor: AppColors.primaryDark,
          elevation: 2,
        ),
        navigationRailTheme: NavigationRailThemeData(
          backgroundColor: AppColors.surfaceDark,
          indicatorColor: AppColors.primaryDark.withValues(alpha: 0.3),
          elevation: 0,
        ),
        chipTheme: ChipThemeData(
          backgroundColor: AppColors.surfaceDark,
          selectedColor: AppColors.primaryDark.withValues(alpha: 0.3),
          labelStyle: AppTextStyles.labelMedium.copyWith(
            color: AppColors.textPrimaryDark,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppColors.surfaceDark,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.dividerDark),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.dividerDark),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.primaryLight, width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.error),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      );

  // ─── Helpers ──────────────────────────────────────────

  static TextTheme _textTheme(Color primaryColor) => TextTheme(
        displayLarge: AppTextStyles.displayLarge.copyWith(color: primaryColor),
        displayMedium: AppTextStyles.displayMedium.copyWith(color: primaryColor),
        displaySmall: AppTextStyles.displaySmall.copyWith(color: primaryColor),
        headlineLarge: AppTextStyles.headlineLarge.copyWith(color: primaryColor),
        headlineMedium: AppTextStyles.headlineMedium.copyWith(color: primaryColor),
        headlineSmall: AppTextStyles.headlineSmall.copyWith(color: primaryColor),
        titleLarge: AppTextStyles.titleLarge.copyWith(color: primaryColor),
        titleMedium: AppTextStyles.titleMedium.copyWith(color: primaryColor),
        titleSmall: AppTextStyles.titleSmall.copyWith(color: primaryColor),
        bodyLarge: AppTextStyles.bodyLarge.copyWith(color: primaryColor),
        bodyMedium: AppTextStyles.bodyMedium.copyWith(color: primaryColor),
        bodySmall: AppTextStyles.bodySmall.copyWith(color: primaryColor),
        labelLarge: AppTextStyles.labelLarge.copyWith(color: primaryColor),
        labelMedium: AppTextStyles.labelMedium.copyWith(color: primaryColor),
        labelSmall: AppTextStyles.labelSmall.copyWith(color: primaryColor),
      );
}
