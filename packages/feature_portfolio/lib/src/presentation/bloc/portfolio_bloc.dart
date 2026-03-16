import 'package:core_domain/core_domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/use_cases/get_projects.dart';
import 'portfolio_event.dart';
import 'portfolio_state.dart';

/// BLoC for the portfolio feature.
class PortfolioBloc extends Bloc<PortfolioEvent, PortfolioState> {
  final GetProjects _getProjects;

  PortfolioBloc({required GetProjects getProjects})
      : _getProjects = getProjects,
        super(const PortfolioState()) {
    on<PortfolioLoadRequested>(_onLoadRequested);
    on<PortfolioRefreshRequested>(_onRefreshRequested);
  }

  Future<void> _onLoadRequested(
    PortfolioLoadRequested event,
    Emitter<PortfolioState> emit,
  ) async {
    emit(state.copyWith(
      status: PortfolioStatus.loading,
      errorMessage: () => null,
    ));

    try {
      final projects =
          await _getProjects(GetProjectsParams(type: event.type));
      emit(state.copyWith(
        status: PortfolioStatus.loaded,
        projects: projects,
        activeFilter: () => event.type,
      ));
    } on AppException catch (e) {
      emit(state.copyWith(
        status: PortfolioStatus.error,
        errorMessage: () => e.message,
      ));
    }
  }

  Future<void> _onRefreshRequested(
    PortfolioRefreshRequested event,
    Emitter<PortfolioState> emit,
  ) async {
    try {
      final projects =
          await _getProjects(GetProjectsParams(type: state.activeFilter));
      emit(state.copyWith(
        status: PortfolioStatus.loaded,
        projects: projects,
        errorMessage: () => null,
      ));
    } on AppException catch (e) {
      emit(state.copyWith(
        status: PortfolioStatus.error,
        errorMessage: () => e.message,
      ));
    }
  }
}
