import 'package:core_domain/core_domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/use_cases/get_blog_posts.dart';
import '../../domain/use_cases/get_blog_post_by_slug.dart';
import 'blog_event.dart';
import 'blog_state.dart';

/// BLoC for the blog feature.
///
/// Manages loading posts, filtering by tag, and selecting individual posts.
class BlogBloc extends Bloc<BlogEvent, BlogState> {
  final GetBlogPosts _getBlogPosts;
  final GetBlogPostBySlug _getBlogPostBySlug;

  BlogBloc({
    required GetBlogPosts getBlogPosts,
    required GetBlogPostBySlug getBlogPostBySlug,
  })  : _getBlogPosts = getBlogPosts,
        _getBlogPostBySlug = getBlogPostBySlug,
        super(const BlogState()) {
    on<BlogLoadRequested>(_onLoadRequested);
    on<BlogPostSelected>(_onPostSelected);
    on<BlogPostDeselected>(_onPostDeselected);
    on<BlogRefreshRequested>(_onRefreshRequested);
  }

  Future<void> _onLoadRequested(
    BlogLoadRequested event,
    Emitter<BlogState> emit,
  ) async {
    emit(state.copyWith(
      status: BlogStatus.loading,
      errorMessage: () => null,
    ));

    try {
      final posts = await _getBlogPosts(
        GetBlogPostsParams(tag: event.tag),
      );
      emit(state.copyWith(
        status: BlogStatus.loaded,
        posts: posts,
        activeTag: () => event.tag,
      ));
    } on AppException catch (e) {
      emit(state.copyWith(
        status: BlogStatus.error,
        errorMessage: () => e.message,
      ));
    }
  }

  Future<void> _onPostSelected(
    BlogPostSelected event,
    Emitter<BlogState> emit,
  ) async {
    if (state.status != BlogStatus.loaded) return;

    try {
      final post = await _getBlogPostBySlug(event.slug);
      emit(state.copyWith(selectedPost: () => post));
    } on AppException catch (e) {
      emit(state.copyWith(
        status: BlogStatus.error,
        errorMessage: () => e.message,
      ));
    }
  }

  void _onPostDeselected(
    BlogPostDeselected event,
    Emitter<BlogState> emit,
  ) {
    if (state.status != BlogStatus.loaded) return;
    emit(state.copyWith(selectedPost: () => null));
  }

  Future<void> _onRefreshRequested(
    BlogRefreshRequested event,
    Emitter<BlogState> emit,
  ) async {
    try {
      final posts = await _getBlogPosts(
        GetBlogPostsParams(tag: state.activeTag),
      );
      emit(state.copyWith(
        status: BlogStatus.loaded,
        posts: posts,
        errorMessage: () => null,
      ));
    } on AppException catch (e) {
      emit(state.copyWith(
        status: BlogStatus.error,
        errorMessage: () => e.message,
      ));
    }
  }
}
