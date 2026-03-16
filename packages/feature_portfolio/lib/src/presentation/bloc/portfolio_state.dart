import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/project.dart';

part 'portfolio_state.freezed.dart';

/// Status of the portfolio feature.
enum PortfolioStatus { initial, loading, loaded, error }

/// State for the portfolio BLoC.
///
/// Uses a single concrete class with a status enum so data persists
/// across status transitions (e.g. refresh failure keeps projects).
@freezed
class PortfolioState with _$PortfolioState {
  const factory PortfolioState({
    @Default(PortfolioStatus.initial) PortfolioStatus status,
    @Default([]) List<Project> projects,
    ProjectType? activeFilter,
    String? errorMessage,
  }) = _PortfolioState;
}
