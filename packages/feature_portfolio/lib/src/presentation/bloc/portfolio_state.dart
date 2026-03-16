import 'package:equatable/equatable.dart';

import '../../domain/entities/project.dart';

/// Status of the portfolio feature.
enum PortfolioStatus { initial, loading, loaded, error }

/// State for the portfolio BLoC.
///
/// Uses the concrete-class + status-enum pattern so data persists
/// across status transitions (e.g. refresh failure keeps projects).
class PortfolioState extends Equatable {
  final PortfolioStatus status;
  final List<Project> projects;
  final ProjectType? activeFilter;
  final String? errorMessage;

  const PortfolioState({
    this.status = PortfolioStatus.initial,
    this.projects = const [],
    this.activeFilter,
    this.errorMessage,
  });

  PortfolioState copyWith({
    PortfolioStatus? status,
    List<Project>? projects,
    ProjectType? Function()? activeFilter,
    String? Function()? errorMessage,
  }) {
    return PortfolioState(
      status: status ?? this.status,
      projects: projects ?? this.projects,
      activeFilter:
          activeFilter != null ? activeFilter() : this.activeFilter,
      errorMessage:
          errorMessage != null ? errorMessage() : this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, projects, activeFilter, errorMessage];
}
