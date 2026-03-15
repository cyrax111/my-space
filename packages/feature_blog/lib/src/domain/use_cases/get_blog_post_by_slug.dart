import '../entities/blog_post.dart';
import '../repositories/blog_repository.dart';

/// Retrieves a single blog post by its URL slug.
class GetBlogPostBySlug {
  final BlogRepository _repository;

  GetBlogPostBySlug(this._repository);

  Future<BlogPost> call(String slug) =>
      _repository.getPostBySlug(slug);
}
