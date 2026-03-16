import 'package:equatable/equatable.dart';

import '../../domain/entities/blog_post.dart';

/// Status of the blog feature.
enum BlogStatus { initial, loading, loaded, error }

/// State for the blog feature BLoC.
///
/// Uses the concrete-class + status-enum pattern so data persists
/// across status transitions (e.g. refresh failure keeps posts).
class BlogState extends Equatable {
  final BlogStatus status;
  final List<BlogPost> posts;
  final String? activeTag;
  final BlogPost? selectedPost;
  final String? errorMessage;

  const BlogState({
    this.status = BlogStatus.initial,
    this.posts = const [],
    this.activeTag,
    this.selectedPost,
    this.errorMessage,
  });

  BlogState copyWith({
    BlogStatus? status,
    List<BlogPost>? posts,
    String? Function()? activeTag,
    BlogPost? Function()? selectedPost,
    String? Function()? errorMessage,
  }) {
    return BlogState(
      status: status ?? this.status,
      posts: posts ?? this.posts,
      activeTag: activeTag != null ? activeTag() : this.activeTag,
      selectedPost:
          selectedPost != null ? selectedPost() : this.selectedPost,
      errorMessage:
          errorMessage != null ? errorMessage() : this.errorMessage,
    );
  }

  @override
  List<Object?> get props =>
      [status, posts, activeTag, selectedPost, errorMessage];
}
