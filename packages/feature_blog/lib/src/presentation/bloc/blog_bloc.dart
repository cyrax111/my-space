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
        super(const BlogState.initial()) {
    on<BlogLoadRequested>(_onLoadRequested);
    on<BlogPostSelected>(_onPostSelected);
    on<BlogPostDeselected>(_onPostDeselected);
    on<BlogRefreshRequested>(_onRefreshRequested);
  }

  String? _currentTag;

  Future<void> _onLoadRequested(
    BlogLoadRequested event,
    Emitter<BlogState> emit,
  ) async {
    _currentTag = event.tag;
    emit(const BlogState.loading());

    final result = await _getBlogPosts(
      GetBlogPostsParams(tag: event.tag),
    );

    result.fold(
      (failure) => emit(BlogState.error(message: failure.displayMessage)),
      (posts) => emit(BlogState.loaded(posts: posts, activeTag: event.tag)),
    );
  }

  Future<void> _onPostSelected(
    BlogPostSelected event,
    Emitter<BlogState> emit,
  ) async {
    final currentState = state;
    if (currentState is! BlogLoaded) return;

    final result = await _getBlogPostBySlug(event.slug);

    result.fold(
      (failure) => emit(BlogState.error(message: failure.displayMessage)),
      (post) => emit(currentState.copyWith(selectedPost: post)),
    );
  }

  void _onPostDeselected(
    BlogPostDeselected event,
    Emitter<BlogState> emit,
  ) {
    final currentState = state;
    if (currentState is! BlogLoaded) return;
    emit(currentState.copyWith(selectedPost: null));
  }

  Future<void> _onRefreshRequested(
    BlogRefreshRequested event,
    Emitter<BlogState> emit,
  ) async {
    final result = await _getBlogPosts(
      GetBlogPostsParams(tag: _currentTag),
    );

    result.fold(
      (failure) => emit(BlogState.error(message: failure.displayMessage)),
      (posts) =>
          emit(BlogState.loaded(posts: posts, activeTag: _currentTag)),
    );
  }
}
