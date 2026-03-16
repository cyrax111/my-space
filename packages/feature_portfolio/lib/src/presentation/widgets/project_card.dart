import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/project.dart';
import '../pages/portfolio_page.dart';

/// Card widget for a portfolio project.
class ProjectCard extends StatelessWidget {
  final Project project;
  final VoidCallback? onTap;

  const ProjectCard({
    super.key,
    required this.project,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppCard(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Type badge + featured
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.sm,
                  vertical: AppSpacing.xxs,
                ),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  project.type.displayName,
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              if (project.isFeatured) ...[
                const SizedBox(width: AppSpacing.sm),
                Icon(
                  Icons.star_rounded,
                  size: 16,
                  color: theme.colorScheme.secondary,
                ),
              ],
            ],
          ),
          const SizedBox(height: AppSpacing.sm),

          // Title
          Text(
            project.title,
            style: theme.textTheme.titleMedium,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: AppSpacing.xs),

          // Description
          Text(
            project.description,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: AppSpacing.md),

          // Tech stack chips
          Wrap(
            spacing: AppSpacing.xs,
            runSpacing: AppSpacing.xxs,
            children: project.techStack.take(4).map((tech) {
              return Chip(
                label: Text(tech),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                visualDensity: VisualDensity.compact,
                labelStyle: theme.textTheme.labelSmall,
                padding: EdgeInsets.zero,
              );
            }).toList(),
          ),

          // Links row
          if (project.repoUrl != null || project.liveUrl != null) ...[
            const SizedBox(height: AppSpacing.sm),
            Row(
              children: [
                if (project.repoUrl != null)
                  SocialIconButton(
                    icon: Icons.code,
                    label: 'Source code',
                    onPressed: () {
                      // URL launch handled at app level
                    },
                  ),
                if (project.liveUrl != null)
                  SocialIconButton(
                    icon: Icons.launch,
                    label: 'Live demo',
                    onPressed: () {
                      // URL launch handled at app level
                    },
                  ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
