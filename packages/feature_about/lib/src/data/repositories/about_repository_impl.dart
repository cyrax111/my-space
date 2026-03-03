import 'package:injectable/injectable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:core_domain/core_domain.dart';
import '../../domain/entities/about.dart';
import '../../domain/repositories/about_repository.dart';
import '../data_sources/about_local_data_source.dart';
import '../models/about_model.dart';

@LazySingleton(as: AboutRepository)
class AboutRepositoryImpl implements AboutRepository {
  final AboutLocalDataSource _localDataSource;

  AboutRepositoryImpl(this._localDataSource);

  @override
  Future<Either<Failure, List<About>>> getAll() async {
    try {
      final models = await _localDataSource.getAll();
      return Right(models.map((m) => m.toEntity()).toList());
    } catch (e) {
      return Left(Failure.storage(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, About>> getById(String id) async {
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
  Future<Either<Failure, About>> create(About about) async {
    try {
      final model = AboutModel.fromEntity(about);
      final created = await _localDataSource.create(model);
      return Right(created.toEntity());
    } catch (e) {
      return Left(Failure.storage(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, About>> update(About about) async {
    try {
      final model = AboutModel.fromEntity(about);
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
