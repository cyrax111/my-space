/// Responsive breakpoints for adaptive layouts
class Breakpoints {
  Breakpoints._();

  /// Compact: phones (< 600)
  static const double compact = 600;

  /// Medium: tablets and foldables (600-1024)
  static const double medium = 1024;

  /// Expanded: desktop and web (> 1024)
  static const double expanded = 1024;
}

/// Layout size based on screen width
enum LayoutSize {
  compact,
  medium,
  expanded;

  static LayoutSize fromWidth(double width) {
    if (width < Breakpoints.compact) {
      return LayoutSize.compact;
    } else if (width < Breakpoints.medium) {
      return LayoutSize.medium;
    } else {
      return LayoutSize.expanded;
    }
  }

  bool get isCompact => this == LayoutSize.compact;
  bool get isMedium => this == LayoutSize.medium;
  bool get isExpanded => this == LayoutSize.expanded;
}
