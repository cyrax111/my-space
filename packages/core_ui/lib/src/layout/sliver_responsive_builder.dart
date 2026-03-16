import 'package:flutter/material.dart';

import 'breakpoints.dart';

/// Sliver-compatible version of [ResponsiveBuilder].
///
/// Uses [SliverLayoutBuilder] so it can be placed directly inside
/// a [CustomScrollView] or as the child of other sliver widgets.
/// Each builder callback must return a **sliver** widget.
///
/// ```dart
/// SliverResponsiveBuilder(
///   compact: (context) => SliverList(...),
///   expanded: (context) => SliverGrid(...),
/// )
/// ```
class SliverResponsiveBuilder extends StatelessWidget {
  /// Widget builder for compact screens (phones). Must return a sliver.
  final WidgetBuilder compact;

  /// Widget builder for medium screens (tablets). Falls back to [compact].
  /// Must return a sliver.
  final WidgetBuilder? medium;

  /// Widget builder for expanded screens (desktop). Falls back to [medium]
  /// or [compact]. Must return a sliver.
  final WidgetBuilder? expanded;

  const SliverResponsiveBuilder({
    super.key,
    required this.compact,
    this.medium,
    this.expanded,
  });

  @override
  Widget build(BuildContext context) {
    return SliverLayoutBuilder(
      builder: (context, constraints) {
        final size = LayoutSize.fromWidth(constraints.crossAxisExtent);
        return switch (size) {
          LayoutSize.expanded => (expanded ?? medium ?? compact)(context),
          LayoutSize.medium => (medium ?? compact)(context),
          LayoutSize.compact => compact(context),
        };
      },
    );
  }
}
