import '../entities/blog_post.dart';
import '../repositories/blog_repository.dart';

/// Parameters for [GetBlogPosts].
class GetBlogPostsParams {
  final String? tag;
  final int? limit;
  final int? offset;

  const GetBlogPostsParams({this.tag, this.limit, this.offset});
}

/// Retrieves a list of published blog posts.
class GetBlogPosts {
  final BlogRepository _repository;

  GetBlogPosts(this._repository);

  Future<List<BlogPost>> call(GetBlogPostsParams params) =>
      _repository.getPosts(
        tag: params.tag,
        limit: params.limit,
        offset: params.offset,
      );
}
