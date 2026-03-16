import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/blog_post.dart';
import '../bloc/blog_bloc.dart';
import '../bloc/blog_event.dart';
import '../bloc/blog_state.dart';
import '../widgets/blog_post_card.dart';
import 'blog_detail_page.dart';

/// Master-detail blog page for expanded (desktop) layouts.
///
/// Shows the blog list on the left and selected post content on the right.
/// On compact/medium screens, delegates to [BlogListPage] with navigation.
class BlogMasterDetailPage extends StatelessWidget {
  /// Called when a post is tapped on compact/medium screens
  /// (triggers route navigation).
  final void Function(String slug)? onPostTap;

  const BlogMasterDetailPage({super.key, this.onPostTap});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final layoutSize = LayoutSize.fromWidth(constraints.maxWidth);

        if (layoutSize == LayoutSize.expanded) {
          return _DesktopSplitView(onPostTap: onPostTap);
        }

        // On compact/medium, show just the list with navigation
        return _BlogList(onPostTap: onPostTap);
      },
    );
  }
}

/// Desktop split view: list on left, detail on right.
class _DesktopSplitView extends StatelessWidget {
  final void Function(String slug)? onPostTap;

  const _DesktopSplitView({this.onPostTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<BlogBloc, BlogState>(
      builder: (context, state) {
        return Row(
          children: [
            // Left: blog list
            SizedBox(
              width: 420,
              child: _BlogList(
                onPostTap: (slug) {
                  context
                      .read<BlogBloc>()
                      .add(BlogEvent.postSelected(slug: slug));
                },
                selectedSlug: state.selectedPost?.slug,
              ),
            ),
            VerticalDivider(
              thickness: 1,
              width: 1,
              color: theme.dividerColor,
            ),
            // Right: detail pane
            Expanded(
              child: state.selectedPost != null
                  ? _DetailPane(post: state.selectedPost!)
                  : const _EmptyDetailPane(),
            ),
          ],
        );
      },
    );
  }
}

/// Blog list with optional selected highlight.
class _BlogList extends StatelessWidget {
  final void Function(String slug)? onPostTap;
  final String? selectedSlug;

  const _BlogList({this.onPostTap, this.selectedSlug});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlogBloc, BlogState>(
      builder: (context, state) => switch (state.status) {
        BlogStatus.initial ||
        BlogStatus.loading when state.posts.isEmpty =>
          const LoadingIndicator(message: 'Loading posts...'),
        BlogStatus.error when state.posts.isEmpty => ErrorView(
            message: state.errorMessage ?? 'Something went wrong',
            onRetry: () => context
                .read<BlogBloc>()
                .add(const BlogEvent.loadRequested()),
          ),
        _ => state.posts.isEmpty
            ? const EmptyState(
                icon: Icons.article_outlined,
                message: 'No posts yet. Check back soon!',
              )
            : RefreshIndicator(
                onRefresh: () async {
                  context
                      .read<BlogBloc>()
                      .add(const BlogEvent.refreshRequested());
                },
                child: CustomScrollView(
                  slivers: [
                    SliverPadding(
                      padding: const EdgeInsets.all(AppSpacing.md),
                      sliver: SliverToBoxAdapter(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SectionHeader(
                              title: 'Blog',
                              subtitle: state.activeTag != null
                                  ? 'Filtered by: ${state.activeTag}'
                                  : '${state.posts.length} posts',
                            ),
                            if (state.status == BlogStatus.error &&
                                state.errorMessage != null)
                              Padding(
                                padding: const EdgeInsets.only(
                                    bottom: AppSpacing.sm),
                                child: Text(
                                  'Refresh failed: ${state.errorMessage}',
                                  style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.error,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                    SliverPadding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.md,
                      ),
                      sliver: SliverList.separated(
                        itemCount: state.posts.length,
                        separatorBuilder: (_, __) =>
                            const SizedBox(height: AppSpacing.md),
                        itemBuilder: (context, index) {
                          final post = state.posts[index];
                          final isSelected = post.slug == selectedSlug;
                          return _SelectableBlogPostCard(
                            post: post,
                            isSelected: isSelected,
                            onTap: () => onPostTap?.call(post.slug),
                          );
                        },
                      ),
                    ),
                    const SliverToBoxAdapter(
                      child: SizedBox(height: AppSpacing.xxl),
                    ),
                  ],
                ),
              ),
      },
    );
  }
}

/// Blog post card with selection highlight for desktop view.
class _SelectableBlogPostCard extends StatelessWidget {
  final BlogPost post;
  final bool isSelected;
  final VoidCallback? onTap;

  const _SelectableBlogPostCard({
    required this.post,
    required this.isSelected,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: isSelected
            ? Border.all(color: theme.colorScheme.primary, width: 2)
            : null,
      ),
      child: BlogPostCard(
        post: post,
        onTap: onTap,
      ),
    );
  }
}

/// Detail pane showing the selected post.
class _DetailPane extends StatelessWidget {
  final BlogPost post;

  const _DetailPane({required this.post});

  @override
  Widget build(BuildContext context) {
    // Reuse the _PostContent from BlogDetailPage by wrapping it
    return BlogDetailContent(post: post);
  }
}

/// Empty state for the detail pane when no post is selected.
class _EmptyDetailPane extends StatelessWidget {
  const _EmptyDetailPane();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.article_outlined,
            size: 64,
            color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.4),
          ),
          const SizedBox(height: AppSpacing.md),
          Text(
            'Select a post to read',
            style: theme.textTheme.titleMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
