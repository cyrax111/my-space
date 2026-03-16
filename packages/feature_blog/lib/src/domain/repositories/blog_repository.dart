import '../entities/blog_post.dart';

/// Repository contract for blog posts.
///
/// Defined in the domain layer — implementations live in the data layer.
abstract class BlogRepository {
  /// Get all published blog posts, optionally filtered by [tag].
  ///
  /// Throws [NetworkException] or [StorageException] on failure.
  Future<List<BlogPost>> getPosts({
    String? tag,
    int? limit,
    int? offset,
  });

  /// Get a single blog post by its [slug].
  ///
  /// Throws [NotFoundException] if no post matches.
  Future<BlogPost> getPostBySlug(String slug);

  /// Get all available tags.
  ///
  /// Throws [StorageException] on failure.
  Future<List<String>> getTags();
}
