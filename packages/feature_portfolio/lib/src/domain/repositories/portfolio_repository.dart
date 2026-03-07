import 'package:core_domain/core_domain.dart';
import 'package:fpdart/fpdart.dart';

import '../entities/project.dart';

/// Repository contract for portfolio projects.
abstract class PortfolioRepository {
  /// Get all projects, optionally filtered by [type].
  Future<Either<Failure, List<Project>>> getProjects({ProjectType? type});

  /// Get a single project by [id].
  Future<Either<Failure, Project>> getProjectById(String id);

  /// Get featured projects only.
  Future<Either<Failure, List<Project>>> getFeaturedProjects();
}
