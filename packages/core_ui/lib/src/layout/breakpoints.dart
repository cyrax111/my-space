/// Responsive layout breakpoints.
///
/// Three-tier layout system matching Material 3 adaptive guidelines:
/// - Compact: < 600px (phones)
/// - Medium: 600–1024px (tablets, foldables)
/// - Expanded: > 1024px (desktop, web)
enum LayoutSize {
  compact,
  medium,
  expanded;

  /// Determine layout size from screen width.
  static LayoutSize fromWidth(double width) {
    if (width < 600) return LayoutSize.compact;
    if (width <= 1024) return LayoutSize.medium;
    return LayoutSize.expanded;
  }

  /// Whether this is a compact (phone) layout.
  bool get isCompact => this == LayoutSize.compact;

  /// Whether this is a medium (tablet) layout.
  bool get isMedium => this == LayoutSize.medium;

  /// Whether this is an expanded (desktop) layout.
  bool get isExpanded => this == LayoutSize.expanded;

  /// Whether this layout shows a navigation rail or sidebar.
  bool get hasRailOrSidebar => this != LayoutSize.compact;

  /// Whether this layout shows a master-detail split.
  bool get hasMasterDetail => this == LayoutSize.expanded;
}

/// Breakpoint constants.
abstract final class Breakpoints {
  static const double compact = 0;
  static const double medium = 600;
  static const double expanded = 1024;
}
