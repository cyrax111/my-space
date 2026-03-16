import 'package:flutter/material.dart';

import 'breakpoints.dart';
import '../theme/app_spacing.dart';

/// Sliver-compatible adaptive horizontal padding.
///
/// Applies different horizontal padding based on layout size
/// and optionally constrains content width.
class SliverAdaptivePadding extends StatelessWidget {
  final Widget sliver;
  final bool constrainWidth;

  const SliverAdaptivePadding({
    super.key,
    required this.sliver,
    this.constrainWidth = true,
  });

  @override
  Widget build(BuildContext context) {
    return SliverLayoutBuilder(
      builder: (context, constraints) {
        final viewportWidth = constraints.crossAxisExtent;
        final layoutSize = LayoutSize.fromWidth(viewportWidth);
        final padding = switch (layoutSize) {
          LayoutSize.compact => AppSpacing.pagePaddingCompact,
          LayoutSize.medium => AppSpacing.pagePaddingMedium,
          LayoutSize.expanded => AppSpacing.pagePaddingExpanded,
        };

        double extraPadding = 0;
        if (constrainWidth && viewportWidth > AppSpacing.maxContentWidth) {
          extraPadding =
              (viewportWidth - AppSpacing.maxContentWidth) / 2;
        }

        return SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: padding + extraPadding),
          sliver: sliver,
        );
      },
    );
  }
}
