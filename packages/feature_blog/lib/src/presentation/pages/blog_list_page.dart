import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/blog_bloc.dart';
import '../bloc/blog_event.dart';
import '../bloc/blog_state.dart';
import '../widgets/blog_post_card.dart';

/// Blog list page — shows all published posts with tag filtering.
class BlogListPage extends StatelessWidget {
  /// Called when a post card is tapped.
  final void Function(String slug)? onPostTap;

  const BlogListPage({super.key, this.onPostTap});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlogBloc, BlogState>(
      builder: (context, state) => switch (state) {
        BlogInitial() => const LoadingIndicator(message: 'Loading posts...'),
        BlogLoading() => const LoadingIndicator(message: 'Loading posts...'),
        BlogError(:final message) => ErrorView(
            message: message,
            onRetry: () => context
                .read<BlogBloc>()
                .add(const BlogEvent.loadRequested()),
          ),
        BlogLoaded(:final posts, :final activeTag) => posts.isEmpty
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
                    SliverAdaptivePadding(
                      sliver: SliverToBoxAdapter(
                        child: SectionHeader(
                          title: 'Blog',
                          subtitle: activeTag != null
                              ? 'Filtered by: $activeTag'
                              : '${posts.length} posts',
                        ),
                      ),
                    ),
                    SliverAdaptivePadding(
                      sliver: SliverList.separated(
                        itemCount: posts.length,
                        separatorBuilder: (_, __) =>
                            const SizedBox(height: AppSpacing.md),
                        itemBuilder: (context, index) {
                          final post = posts[index];
                          return BlogPostCard(
                            post: post,
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
