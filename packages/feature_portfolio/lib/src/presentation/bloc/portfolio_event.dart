import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/project.dart';

part 'portfolio_event.freezed.dart';

/// Events for the portfolio BLoC.
@freezed
sealed class PortfolioEvent with _$PortfolioEvent {
  const factory PortfolioEvent.loadRequested({ProjectType? type}) =
      PortfolioLoadRequested;

  const factory PortfolioEvent.refreshRequested() = PortfolioRefreshRequested;
}
