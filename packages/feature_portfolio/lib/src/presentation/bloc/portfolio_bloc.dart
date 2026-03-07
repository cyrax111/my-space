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

    final result = await _getProjects(GetProjectsParams(type: event.type));

    result.fold(
      (failure) =>
          emit(PortfolioState.error(message: failure.displayMessage)),
      (projects) => emit(PortfolioState.loaded(
        projects: projects,
        activeFilter: event.type,
      )),
    );
  }

  Future<void> _onRefreshRequested(
    PortfolioRefreshRequested event,
    Emitter<PortfolioState> emit,
  ) async {
    final result =
        await _getProjects(GetProjectsParams(type: _currentFilter));

    result.fold(
      (failure) =>
          emit(PortfolioState.error(message: failure.displayMessage)),
      (projects) => emit(PortfolioState.loaded(
        projects: projects,
        activeFilter: _currentFilter,
      )),
    );
  }
}
