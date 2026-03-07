import 'package:core_domain/core_domain.dart';

import '../entities/blog_post.dart';
import '../repositories/blog_repository.dart';

/// Retrieves a single blog post by its URL slug.
class GetBlogPostBySlug extends UseCase<BlogPost, String> {
  final BlogRepository _repository;

  GetBlogPostBySlug(this._repository);

  @override
  Future<BlogPost> call(String slug) =>
      _repository.getPostBySlug(slug);
}
