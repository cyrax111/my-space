import 'package:core_domain/core_domain.dart';
import 'package:fpdart/fpdart.dart';

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
  Future<Either<Failure, List<BlogPost>>> getPosts({
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
      return right(models.map((m) => m.toEntity()).toList());
    } catch (e, st) {
      return left(Failure.unknown(
        message: 'Failed to load blog posts',
        error: e,
        stackTrace: st,
      ));
    }
  }

  @override
  Future<Either<Failure, BlogPost>> getPostBySlug(String slug) async {
    try {
      final model = await _localDataSource.getPostBySlug(slug);
      if (model == null) {
        return left(Failure.notFound(entity: 'BlogPost', id: slug));
      }
      return right(model.toEntity());
    } catch (e, st) {
      return left(Failure.unknown(
        message: 'Failed to load blog post',
        error: e,
        stackTrace: st,
      ));
    }
  }

  @override
  Future<Either<Failure, List<String>>> getTags() async {
    try {
      final tags = await _localDataSource.getTags();
      return right(tags);
    } catch (e, st) {
      return left(Failure.unknown(
        message: 'Failed to load tags',
        error: e,
        stackTrace: st,
      ));
    }
  }
}
