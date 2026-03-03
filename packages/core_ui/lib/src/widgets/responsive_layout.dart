import 'package:flutter/material.dart';
import '../layout/breakpoints.dart';

/// Widget that adapts to different screen sizes
class ResponsiveLayout extends StatelessWidget {
  final Widget compact;
  final Widget? medium;
  final Widget? expanded;

  const ResponsiveLayout({
    super.key,
    required this.compact,
    this.medium,
    this.expanded,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final layoutSize = LayoutSize.fromWidth(constraints.maxWidth);

        switch (layoutSize) {
          case LayoutSize.compact:
            return compact;
          case LayoutSize.medium:
            return medium ?? compact;
          case LayoutSize.expanded:
            return expanded ?? medium ?? compact;
        }
      },
    );
  }
}

/// Extension to get layout size from BuildContext
extension LayoutSizeX on BuildContext {
  LayoutSize get layoutSize {
    final width = MediaQuery.of(this).size.width;
    return LayoutSize.fromWidth(width);
  }

  bool get isCompact => layoutSize.isCompact;
  bool get isMedium => layoutSize.isMedium;
  bool get isExpanded => layoutSize.isExpanded;
}
