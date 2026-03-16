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
                    SliverAdaptivePadding(
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
                    SliverAdaptivePadding(
                      sliver: SliverList.separated(
                        itemCount: state.posts.length,
                        separatorBuilder: (_, __) =>
                            const SizedBox(height: AppSpacing.md),
                        itemBuilder: (context, index) {
                          final post = state.posts[index];
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
