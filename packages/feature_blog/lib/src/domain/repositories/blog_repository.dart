import 'package:core_domain/core_domain.dart';
import 'package:fpdart/fpdart.dart';

import '../entities/blog_post.dart';

/// Repository contract for blog posts.
///
/// Defined in the domain layer — implementations live in the data layer.
abstract class BlogRepository {
  /// Get all published blog posts, optionally filtered by [tag].
  Future<Either<Failure, List<BlogPost>>> getPosts({
    String? tag,
    int? limit,
    int? offset,
  });

  /// Get a single blog post by its [slug].
  Future<Either<Failure, BlogPost>> getPostBySlug(String slug);

  /// Get all available tags.
  Future<Either<Failure, List<String>>> getTags();
}
