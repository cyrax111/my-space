part of 'project_bloc.dart';

@freezed
sealed class ProjectEvent with _$ProjectEvent {
  const factory ProjectEvent.loadProjects() = _LoadProjects;
  const factory ProjectEvent.loadProject(String id) = _LoadProject;
  const factory ProjectEvent.createProject(Project project) = _CreateProject;
  const factory ProjectEvent.updateProject(Project project) = _UpdateProject;
  const factory ProjectEvent.deleteProject(String id) = _DeleteProject;
}
