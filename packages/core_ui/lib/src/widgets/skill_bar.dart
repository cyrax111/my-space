import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';

/// Animated skill progress bar (inspired by adhamdannaway.com/about).
///
/// Shows a skill name with a percentage-filled bar.
class SkillBar extends StatelessWidget {
  final String name;
  final double percentage;
  final Color? color;

  const SkillBar({
    super.key,
    required this.name,
    required this.percentage,
    this.color,
  }) : assert(percentage >= 0 && percentage <= 100);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final barColor = color ?? AppColors.primary;

    return Semantics(
      label: '$name: ${percentage.round()}%',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(name, style: theme.textTheme.bodyMedium),
              Text(
                '${percentage.round()}%',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.xs),
          TweenAnimationBuilder<double>(
            tween: Tween(begin: 0, end: percentage / 100),
            duration: const Duration(milliseconds: 800),
            curve: Curves.easeOutCubic,
            builder: (context, value, _) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: LinearProgressIndicator(
                  value: value,
                  minHeight: 8,
                  backgroundColor: barColor.withValues(alpha: 0.15),
                  valueColor: AlwaysStoppedAnimation(barColor),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
