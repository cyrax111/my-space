import 'package:injectable/injectable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:core_domain/core_domain.dart';
import '../../domain/entities/project.dart';
import '../../domain/repositories/project_repository.dart';
import '../data_sources/project_local_data_source.dart';
import '../models/project_model.dart';

@LazySingleton(as: ProjectRepository)
class ProjectRepositoryImpl implements ProjectRepository {
  final ProjectLocalDataSource _localDataSource;

  ProjectRepositoryImpl(this._localDataSource);

  @override
  Future<Either<Failure, List<Project>>> getAll() async {
    try {
      final models = await _localDataSource.getAll();
      return Right(models.map((m) => m.toEntity()).toList());
    } catch (e) {
      return Left(Failure.storage(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Project>> getById(String id) async {
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
  Future<Either<Failure, Project>> create(Project project) async {
    try {
      final model = ProjectModel.fromEntity(project);
      final created = await _localDataSource.create(model);
      return Right(created.toEntity());
    } catch (e) {
      return Left(Failure.storage(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Project>> update(Project project) async {
    try {
      final model = ProjectModel.fromEntity(project);
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
