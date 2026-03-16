import 'package:flutter/material.dart';

/// Spacing tokens based on an 8px grid system.
///
/// Consistent spacing creates visual rhythm and hierarchy.
abstract final class AppSpacing {
  // ─── Base values ──────────────────────────────────────

  static const double xxs = 2;
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 16;
  static const double lg = 24;
  static const double xl = 32;
  static const double xxl = 48;
  static const double xxxl = 64;

  // ─── Page padding ────────────────────────────────────

  /// Horizontal padding for compact screens (phones).
  static const double pagePaddingCompact = 16;

  /// Horizontal padding for medium screens (tablets).
  static const double pagePaddingMedium = 24;

  /// Horizontal padding for expanded screens (desktop).
  static const double pagePaddingExpanded = 32;

  /// Maximum content width on expanded screens.
  static const double maxContentWidth = 1200;

  // ─── Card ────────────────────────────────────────────

  static const double cardPadding = 16;
  static const double cardBorderRadius = 16;
  static const double cardBorderRadiusSmall = 12;

  // ─── Section ─────────────────────────────────────────

  static const double sectionSpacing = 48;
  static const double sectionSpacingCompact = 32;

  // ─── Convenience EdgeInsets ──────────────────────────

  static const EdgeInsets paddingSm = EdgeInsets.all(sm);
  static const EdgeInsets paddingMd = EdgeInsets.all(md);
  static const EdgeInsets paddingLg = EdgeInsets.all(lg);

  static const EdgeInsets horizontalSm = EdgeInsets.symmetric(horizontal: sm);
  static const EdgeInsets horizontalMd = EdgeInsets.symmetric(horizontal: md);
  static const EdgeInsets horizontalLg = EdgeInsets.symmetric(horizontal: lg);

  static const EdgeInsets verticalSm = EdgeInsets.symmetric(vertical: sm);
  static const EdgeInsets verticalMd = EdgeInsets.symmetric(vertical: md);
  static const EdgeInsets verticalLg = EdgeInsets.symmetric(vertical: lg);
}
