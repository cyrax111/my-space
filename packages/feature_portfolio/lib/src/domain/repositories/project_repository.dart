import 'package:fpdart/fpdart.dart';
import 'package:core_domain/core_domain.dart';
import '../entities/project.dart';

abstract class ProjectRepository {
  Future<Either<Failure, List<Project>>> getAll();
  Future<Either<Failure, Project>> getById(String id);
  Future<Either<Failure, Project>> create(Project project);
  Future<Either<Failure, Project>> update(Project project);
  Future<Either<Failure, void>> delete(String id);
}
