import 'package:injectable/injectable.dart';
import '../models/project_model.dart';

abstract class ProjectLocalDataSource {
  Future<List<ProjectModel>> getAll();
  Future<ProjectModel?> getById(String id);
  Future<ProjectModel> create(ProjectModel project);
  Future<ProjectModel> update(ProjectModel project);
  Future<void> delete(String id);
}

@LazySingleton(as: ProjectLocalDataSource)
class ProjectLocalDataSourceImpl implements ProjectLocalDataSource {
  // TODO: Implement with Drift/SQLite
  // For now, using in-memory storage
  final List<ProjectModel> _storage = [];

  @override
  Future<List<ProjectModel>> getAll() async {
    return List.from(_storage);
  }

  @override
  Future<ProjectModel?> getById(String id) async {
    try {
      return _storage.firstWhere((item) => item.id == id);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<ProjectModel> create(ProjectModel project) async {
    _storage.add(project);
    return project;
  }

  @override
  Future<ProjectModel> update(ProjectModel project) async {
    final index = _storage.indexWhere((item) => item.id == project.id);
    if (index != -1) {
      _storage[index] = project;
    }
    return project;
  }

  @override
  Future<void> delete(String id) async {
    _storage.removeWhere((item) => item.id == id);
  }
}
