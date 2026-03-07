import 'package:freezed_annotation/freezed_annotation.dart';

part 'blog_post.freezed.dart';

/// Immutable blog post entity.
@freezed
class BlogPost with _$BlogPost {
  const BlogPost._();

  const factory BlogPost({
    required String id,
    required String title,
    required String slug,
    required String excerpt,
    required String content,
    required String author,
    required DateTime publishedAt,
    required DateTime updatedAt,
    @Default([]) List<String> tags,
    String? coverImageUrl,
    @Default(false) bool isDraft,
    @Default(0) int readTimeMinutes,
  }) = _BlogPost;

  /// Whether this post has been published.
  bool get isPublished => !isDraft;

  /// Formatted read time (e.g., "5 min read").
  String get readTimeDisplay =>
      '$readTimeMinutes min read';
}
