import 'package:core_domain/core_domain.dart';
import 'package:fpdart/fpdart.dart';

import '../../domain/entities/project.dart';
import '../../domain/repositories/portfolio_repository.dart';
import '../data_sources/portfolio_local_data_source.dart';

/// Concrete implementation of [PortfolioRepository].
class PortfolioRepositoryImpl implements PortfolioRepository {
  final PortfolioLocalDataSource _localDataSource;

  PortfolioRepositoryImpl(this._localDataSource);

  @override
  Future<Either<Failure, List<Project>>> getProjects({
    ProjectType? type,
  }) async {
    try {
      final models = await _localDataSource.getProjects(type: type);
      return right(models.map((m) => m.toEntity()).toList());
    } catch (e, st) {
      return left(Failure.unknown(
        message: 'Failed to load projects',
        error: e,
        stackTrace: st,
      ));
    }
  }

  @override
  Future<Either<Failure, Project>> getProjectById(String id) async {
    try {
      final model = await _localDataSource.getProjectById(id);
      if (model == null) {
        return left(Failure.notFound(entity: 'Project', id: id));
      }
      return right(model.toEntity());
    } catch (e, st) {
      return left(Failure.unknown(
        message: 'Failed to load project',
        error: e,
        stackTrace: st,
      ));
    }
  }

  @override
  Future<Either<Failure, List<Project>>> getFeaturedProjects() async {
    try {
      final models = await _localDataSource.getProjects();
      final featured =
          models.where((m) => m.isFeatured).map((m) => m.toEntity()).toList();
      return right(featured);
    } catch (e, st) {
      return left(Failure.unknown(
        message: 'Failed to load featured projects',
        error: e,
        stackTrace: st,
      ));
    }
  }
}
