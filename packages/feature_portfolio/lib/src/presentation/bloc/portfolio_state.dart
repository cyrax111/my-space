import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/project.dart';

part 'portfolio_state.freezed.dart';

/// State for the portfolio BLoC.
@freezed
sealed class PortfolioState with _$PortfolioState {
  const factory PortfolioState.initial() = PortfolioInitial;
  const factory PortfolioState.loading() = PortfolioLoading;
  const factory PortfolioState.loaded({
    required List<Project> projects,
    ProjectType? activeFilter,
  }) = PortfolioLoaded;
  const factory PortfolioState.error({required String message}) =
      PortfolioError;
}
