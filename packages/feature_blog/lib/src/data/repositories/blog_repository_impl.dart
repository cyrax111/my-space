import 'package:core_domain/core_domain.dart';

import '../../domain/entities/blog_post.dart';
import '../../domain/repositories/blog_repository.dart';
import '../data_sources/blog_local_data_source.dart';

/// Concrete implementation of [BlogRepository].
///
/// Delegates to the local data source. In the future, will coordinate
/// between remote and local sources with caching.
class BlogRepositoryImpl implements BlogRepository {
  final BlogLocalDataSource _localDataSource;

  BlogRepositoryImpl(this._localDataSource);

  @override
  Future<List<BlogPost>> getPosts({
    String? tag,
    int? limit,
    int? offset,
  }) async {
    try {
      final models = await _localDataSource.getPosts(
        tag: tag,
        limit: limit,
        offset: offset,
      );
      return models.map((m) => m.toEntity()).toList();
    } catch (e, st) {
      throw UnknownException(
        'Failed to load blog posts',
        cause: e,
        stackTrace: st,
      );
    }
  }

  @override
  Future<BlogPost> getPostBySlug(String slug) async {
    try {
      final model = await _localDataSource.getPostBySlug(slug);
      if (model == null) {
        throw NotFoundException(
          'Blog post not found',
          entity: 'BlogPost',
          id: slug,
        );
      }
      return model.toEntity();
    } on AppException {
      rethrow;
    } catch (e, st) {
      throw UnknownException(
        'Failed to load blog post',
        cause: e,
        stackTrace: st,
      );
    }
  }

  @override
  Future<List<String>> getTags() async {
    try {
      return await _localDataSource.getTags();
    } catch (e, st) {
      throw UnknownException(
        'Failed to load tags',
        cause: e,
        stackTrace: st,
      );
    }
  }
}
