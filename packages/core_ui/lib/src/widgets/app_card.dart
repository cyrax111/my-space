import 'package:flutter/material.dart';

import '../theme/app_shadows.dart';
import '../theme/app_spacing.dart';

/// Reusable card with hover animation and consistent styling.
///
/// Supports tap callbacks and optional image headers.
class AppCard extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? padding;
  final double? width;
  final double? height;

  const AppCard({
    super.key,
    required this.child,
    this.onTap,
    this.padding,
    this.width,
    this.height,
  });

  @override
  State<AppCard> createState() => _AppCardState();
}

class _AppCardState extends State<AppCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            color: theme.cardColor,
            borderRadius: BorderRadius.circular(AppSpacing.cardBorderRadius),
            border: Border.all(
              color: theme.dividerColor.withValues(alpha: _isHovered ? 0.8 : 0.5),
            ),
            boxShadow: _isHovered ? AppShadows.md : AppShadows.sm,
          ),
          transform: _isHovered
              ? (Matrix4.identity()..translate(0.0, -2.0))
              : Matrix4.identity(),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppSpacing.cardBorderRadius),
            child: Padding(
              padding: widget.padding ??
                  const EdgeInsets.all(AppSpacing.cardPadding),
              child: widget.child,
            ),
          ),
        ),
      ),
    );
  }
}
