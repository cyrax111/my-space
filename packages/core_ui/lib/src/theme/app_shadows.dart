import 'package:flutter/material.dart';

/// Elevation / shadow tokens.
abstract final class AppShadows {
  /// Subtle shadow for cards in rest state.
  static const List<BoxShadow> sm = [
    BoxShadow(
      color: Color(0x0A000000),
      blurRadius: 4,
      offset: Offset(0, 1),
    ),
  ];

  /// Medium shadow for hovered/focused cards.
  static const List<BoxShadow> md = [
    BoxShadow(
      color: Color(0x0F000000),
      blurRadius: 8,
      offset: Offset(0, 4),
    ),
  ];

  /// Large shadow for modals and overlays.
  static const List<BoxShadow> lg = [
    BoxShadow(
      color: Color(0x14000000),
      blurRadius: 16,
      offset: Offset(0, 8),
    ),
  ];

  /// Extra large shadow for floating elements.
  static const List<BoxShadow> xl = [
    BoxShadow(
      color: Color(0x1A000000),
      blurRadius: 24,
      offset: Offset(0, 12),
    ),
  ];
}
