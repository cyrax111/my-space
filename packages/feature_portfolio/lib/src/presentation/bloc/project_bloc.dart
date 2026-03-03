import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:core_domain/core_domain.dart';
import '../../domain/entities/project.dart';
import '../../domain/use_cases/get_projects_use_case.dart';

part 'project_event.dart';
part 'project_state.dart';
part 'project_bloc.freezed.dart';

@injectable
class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  final GetProjectsUseCase _getProjectsUseCase;

  ProjectBloc(this._getProjectsUseCase) : super(const ProjectState.initial()) {
    on<_LoadProjects>(_onLoadProjects);
  }

  Future<void> _onLoadProjects(
    _LoadProjects event,
    Emitter<ProjectState> emit,
  ) async {
    emit(const ProjectState.loading());
    
    final result = await _getProjectsUseCase();
    
    result.fold(
      (failure) => emit(ProjectState.error(failure)),
      (projects) => emit(ProjectState.loaded(projects)),
    );
  }
}
