import '../entities/project.dart';

/// Repository contract for portfolio projects.
abstract class PortfolioRepository {
  /// Get all projects, optionally filtered by [type].
  ///
  /// Throws [StorageException] on failure.
  Future<List<Project>> getProjects({ProjectType? type});

  /// Get a single project by [id].
  ///
  /// Throws [NotFoundException] if no project matches.
  Future<Project> getProjectById(String id);

  /// Get featured projects only.
  ///
  /// Throws [StorageException] on failure.
  Future<List<Project>> getFeaturedProjects();
}
