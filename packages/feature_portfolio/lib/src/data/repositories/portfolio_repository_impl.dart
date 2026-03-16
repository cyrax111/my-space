import 'package:core_domain/core_domain.dart';

import '../../domain/entities/project.dart';
import '../../domain/repositories/portfolio_repository.dart';
import '../data_sources/portfolio_local_data_source.dart';

/// Concrete implementation of [PortfolioRepository].
class PortfolioRepositoryImpl implements PortfolioRepository {
  final PortfolioLocalDataSource _localDataSource;

  PortfolioRepositoryImpl(this._localDataSource);

  @override
  Future<List<Project>> getProjects({ProjectType? type}) async {
    try {
      final models = await _localDataSource.getProjects(type: type);
      return models.map((m) => m.toEntity()).toList();
    } catch (e, st) {
      throw UnknownException(
        'Failed to load projects',
        cause: e,
        stackTrace: st,
      );
    }
  }

  @override
  Future<Project> getProjectById(String id) async {
    try {
      final model = await _localDataSource.getProjectById(id);
      if (model == null) {
        throw NotFoundException(
          'Project not found',
          entity: 'Project',
          id: id,
        );
      }
      return model.toEntity();
    } on AppException {
      rethrow;
    } catch (e, st) {
      throw UnknownException(
        'Failed to load project',
        cause: e,
        stackTrace: st,
      );
    }
  }

  @override
  Future<List<Project>> getFeaturedProjects() async {
    try {
      final models = await _localDataSource.getProjects();
      return models
          .where((m) => m.isFeatured)
          .map((m) => m.toEntity())
          .toList();
    } catch (e, st) {
      throw UnknownException(
        'Failed to load featured projects',
        cause: e,
        stackTrace: st,
      );
    }
  }
}
