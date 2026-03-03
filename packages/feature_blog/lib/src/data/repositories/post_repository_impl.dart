import 'package:injectable/injectable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:core_domain/core_domain.dart';
import '../../domain/entities/post.dart';
import '../../domain/repositories/post_repository.dart';
import '../data_sources/post_local_data_source.dart';
import '../models/post_model.dart';

@LazySingleton(as: PostRepository)
class PostRepositoryImpl implements PostRepository {
  final PostLocalDataSource _localDataSource;

  PostRepositoryImpl(this._localDataSource);

  @override
  Future<Either<Failure, List<Post>>> getAll() async {
    try {
      final models = await _localDataSource.getAll();
      return Right(models.map((m) => m.toEntity()).toList());
    } catch (e) {
      return Left(Failure.storage(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Post>> getById(String id) async {
    try {
      final model = await _localDataSource.getById(id);
      if (model == null) {
        return const Left(Failure.notFound());
      }
      return Right(model.toEntity());
    } catch (e) {
      return Left(Failure.storage(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Post>> create(Post post) async {
    try {
      final model = PostModel.fromEntity(post);
      final created = await _localDataSource.create(model);
      return Right(created.toEntity());
    } catch (e) {
      return Left(Failure.storage(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Post>> update(Post post) async {
    try {
      final model = PostModel.fromEntity(post);
      final updated = await _localDataSource.update(model);
      return Right(updated.toEntity());
    } catch (e) {
      return Left(Failure.storage(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> delete(String id) async {
    try {
      await _localDataSource.delete(id);
      return const Right(null);
    } catch (e) {
      return Left(Failure.storage(message: e.toString()));
    }
  }
}
