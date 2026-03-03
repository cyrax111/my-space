import 'package:injectable/injectable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:core_domain/core_domain.dart';
import '../entities/project.dart';
import '../repositories/project_repository.dart';

@injectable
class GetProjectsUseCase implements UseCaseNoParams<List<Project>> {
  final ProjectRepository _repository;

  GetProjectsUseCase(this._repository);

  @override
  Future<Either<Failure, List<Project>>> call() {
    return _repository.getAll();
  }
}
