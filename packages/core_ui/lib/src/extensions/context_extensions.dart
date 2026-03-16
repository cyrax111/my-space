import 'package:flutter/material.dart';

import '../layout/breakpoints.dart';

/// Convenient context extensions for common lookups.
extension BuildContextX on BuildContext {
  /// Current [ThemeData].
  ThemeData get theme => Theme.of(this);

  /// Current [ColorScheme].
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  /// Current [TextTheme].
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// Current [MediaQueryData].
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  /// Screen width.
  double get screenWidth => MediaQuery.sizeOf(this).width;

  /// Screen height.
  double get screenHeight => MediaQuery.sizeOf(this).height;

  /// Current layout size tier.
  LayoutSize get layoutSize => LayoutSize.fromWidth(screenWidth);

  /// Whether the current theme is dark.
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;

  /// Text scale factor for accessibility.
  double get textScale => MediaQuery.textScaleFactorOf(this);

  /// Whether high contrast mode is active.
  bool get isHighContrast => MediaQuery.highContrastOf(this);

  /// Whether animations should be reduced.
  bool get reduceMotion => MediaQuery.disableAnimationsOf(this);
}
