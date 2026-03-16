import 'package:flutter/material.dart';

import 'breakpoints.dart';

/// Builds different widget trees based on the current layout size.
///
/// ```dart
/// ResponsiveBuilder(
///   compact: (context) => MobileLayout(),
///   medium: (context) => TabletLayout(),
///   expanded: (context) => DesktopLayout(),
/// )
/// ```
class ResponsiveBuilder extends StatelessWidget {
  /// Widget builder for compact screens (phones).
  final WidgetBuilder compact;

  /// Widget builder for medium screens (tablets). Falls back to [compact].
  final WidgetBuilder? medium;

  /// Widget builder for expanded screens (desktop). Falls back to [medium] or [compact].
  final WidgetBuilder? expanded;

  const ResponsiveBuilder({
    super.key,
    required this.compact,
    this.medium,
    this.expanded,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final size = LayoutSize.fromWidth(constraints.maxWidth);
        return switch (size) {
          LayoutSize.expanded => (expanded ?? medium ?? compact)(context),
          LayoutSize.medium => (medium ?? compact)(context),
          LayoutSize.compact => compact(context),
        };
      },
    );
  }
}
