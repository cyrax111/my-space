import '../entities/project.dart';
import '../repositories/portfolio_repository.dart';

/// Parameters for [GetProjects].
class GetProjectsParams {
  final ProjectType? type;
  const GetProjectsParams({this.type});
}

/// Retrieves portfolio projects, optionally filtered by type.
class GetProjects {
  final PortfolioRepository _repository;

  GetProjects(this._repository);

  Future<List<Project>> call(GetProjectsParams params) =>
      _repository.getProjects(type: params.type);
}
