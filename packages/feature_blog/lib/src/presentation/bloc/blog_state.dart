import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/blog_post.dart';

part 'blog_state.freezed.dart';

/// Status of the blog feature.
enum BlogStatus { initial, loading, loaded, error }

/// State for the blog feature BLoC.
///
/// Uses a single concrete class with a status enum so data persists
/// across status transitions (e.g. refresh failure keeps posts).
@freezed
class BlogState with _$BlogState {
  const factory BlogState({
    @Default(BlogStatus.initial) BlogStatus status,
    @Default([]) List<BlogPost> posts,
    String? activeTag,
    BlogPost? selectedPost,
    String? errorMessage,
  }) = _BlogState;
}
