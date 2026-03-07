import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/blog_post.dart';

part 'blog_state.freezed.dart';

/// State for the blog feature BLoC.
@freezed
sealed class BlogState with _$BlogState {
  /// Initial state before any data is loaded.
  const factory BlogState.initial() = BlogInitial;

  /// Posts are being loaded.
  const factory BlogState.loading() = BlogLoading;

  /// Posts loaded successfully.
  const factory BlogState.loaded({
    required List<BlogPost> posts,
    String? activeTag,
    BlogPost? selectedPost,
  }) = BlogLoaded;

  /// An error occurred.
  const factory BlogState.error({required String message}) = BlogError;
}
