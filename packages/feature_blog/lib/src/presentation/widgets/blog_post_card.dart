import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../domain/entities/blog_post.dart';

/// Card widget for a blog post in the list view.
class BlogPostCard extends StatelessWidget {
  final BlogPost post;
  final VoidCallback? onTap;

  const BlogPostCard({
    super.key,
    required this.post,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final dateFormat = DateFormat.yMMMd();

    return AppCard(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Text(
            post.title,
            style: theme.textTheme.titleLarge,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: AppSpacing.sm),

          // Excerpt
          Text(
            post.excerpt,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: AppSpacing.md),

          // Metadata row
          Row(
            children: [
              Text(
                dateFormat.format(post.publishedAt),
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Icon(
                Icons.schedule_outlined,
                size: 14,
                color: theme.colorScheme.onSurfaceVariant,
              ),
              const SizedBox(width: AppSpacing.xxs),
              Text(
                post.readTimeDisplay,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              const Spacer(),
              // Tags (first 2)
              ...post.tags.take(2).map(
                    (tag) => Padding(
                      padding: const EdgeInsets.only(left: AppSpacing.xs),
                      child: TagChip(label: tag),
                    ),
                  ),
            ],
          ),
        ],
      ),
    );
  }
}
