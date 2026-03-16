import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../domain/entities/blog_post.dart';
import '../bloc/blog_bloc.dart';
import '../bloc/blog_event.dart';
import '../bloc/blog_state.dart';

/// Blog detail page — shows the full content of a post.
///
/// Dispatches [BlogPostSelected] on init to load the post by [slug].
class BlogDetailPage extends StatefulWidget {
  final String slug;

  const BlogDetailPage({super.key, required this.slug});

  @override
  State<BlogDetailPage> createState() => _BlogDetailPageState();
}

class _BlogDetailPageState extends State<BlogDetailPage> {
  @override
  void initState() {
    super.initState();
    context.read<BlogBloc>().add(BlogEvent.postSelected(slug: widget.slug));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlogBloc, BlogState>(
      builder: (context, state) {
        if (state.selectedPost == null) {
          if (state.status == BlogStatus.error) {
            return ErrorView(
              message: state.errorMessage ?? 'Failed to load post',
              onRetry: () => context
                  .read<BlogBloc>()
                  .add(BlogEvent.postSelected(slug: widget.slug)),
            );
          }
          return const LoadingIndicator(message: 'Loading post...');
        }
        return _PostContent(post: state.selectedPost!);
      },
    );
  }
}

class _PostContent extends StatelessWidget {
  final BlogPost post;

  const _PostContent({required this.post});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final dateFormat = DateFormat.yMMMd();

    return CustomScrollView(
      slivers: [
        // Cover image
        if (post.coverImageUrl != null)
          SliverToBoxAdapter(
            child: AppImage(
              url: post.coverImageUrl!,
              height: 280,
              semanticLabel: 'Cover image for ${post.title}',
            ),
          ),

        // Metadata
        SliverAdaptivePadding(
          sliver: SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(
                top: AppSpacing.lg,
                bottom: AppSpacing.sm,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    post.title,
                    style: theme.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.sm),

                  // Author, date, read time
                  Wrap(
                    spacing: AppSpacing.md,
                    runSpacing: AppSpacing.xs,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.person_outline,
                            size: 16,
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                          const SizedBox(width: AppSpacing.xs),
                          Text(
                            post.author,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.calendar_today_outlined,
                            size: 16,
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                          const SizedBox(width: AppSpacing.xs),
                          Text(
                            dateFormat.format(post.publishedAt),
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.schedule_outlined,
                            size: 16,
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                          const SizedBox(width: AppSpacing.xs),
                          Text(
                            post.readTimeDisplay,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  // Tags
                  if (post.tags.isNotEmpty) ...[
                    const SizedBox(height: AppSpacing.md),
                    Wrap(
                      spacing: AppSpacing.sm,
                      runSpacing: AppSpacing.xs,
                      children: post.tags
                          .map((tag) => TagChip(label: tag))
                          .toList(),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),

        // Divider
        SliverAdaptivePadding(
          sliver: SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
              child: Divider(color: theme.dividerColor),
            ),
          ),
        ),

        // Content body
        SliverAdaptivePadding(
          sliver: SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.xxl),
              child: SelectableText(
                post.content,
                style: theme.textTheme.bodyLarge?.copyWith(
                  height: 1.8,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
