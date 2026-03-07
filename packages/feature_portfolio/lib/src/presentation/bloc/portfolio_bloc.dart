import 'package:core_domain/core_domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/project.dart';
import '../../domain/use_cases/get_projects.dart';
import 'portfolio_event.dart';
import 'portfolio_state.dart';

/// BLoC for the portfolio feature.
class PortfolioBloc extends Bloc<PortfolioEvent, PortfolioState> {
  final GetProjects _getProjects;

  PortfolioBloc({required GetProjects getProjects})
      : _getProjects = getProjects,
        super(const PortfolioState.initial()) {
    on<PortfolioLoadRequested>(_onLoadRequested);
    on<PortfolioRefreshRequested>(_onRefreshRequested);
  }

  ProjectType? _currentFilter;

  Future<void> _onLoadRequested(
    PortfolioLoadRequested event,
    Emitter<PortfolioState> emit,
  ) async {
    _currentFilter = event.type;
    emit(const PortfolioState.loading());

    try {
      final projects =
          await _getProjects(GetProjectsParams(type: event.type));
      emit(PortfolioState.loaded(
        projects: projects,
        activeFilter: event.type,
      ));
    } on AppException catch (e) {
      emit(PortfolioState.error(message: e.message));
    }
  }

  Future<void> _onRefreshRequested(
    PortfolioRefreshRequested event,
    Emitter<PortfolioState> emit,
  ) async {
    try {
      final projects =
          await _getProjects(GetProjectsParams(type: _currentFilter));
      emit(PortfolioState.loaded(
        projects: projects,
        activeFilter: _currentFilter,
      ));
    } on AppException catch (e) {
      emit(PortfolioState.error(message: e.message));
    }
  }
}
