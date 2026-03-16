import 'package:equatable/equatable.dart';

import '../../domain/entities/profile.dart';

/// Status of the about feature.
enum AboutStatus { initial, loading, loaded, error }

/// State for the about BLoC.
///
/// Uses the concrete-class + status-enum pattern.
class AboutState extends Equatable {
  final AboutStatus status;
  final Profile? profile;
  final String? errorMessage;

  const AboutState({
    this.status = AboutStatus.initial,
    this.profile,
    this.errorMessage,
  });

  AboutState copyWith({
    AboutStatus? status,
    Profile? Function()? profile,
    String? Function()? errorMessage,
  }) {
    return AboutState(
      status: status ?? this.status,
      profile: profile != null ? profile() : this.profile,
      errorMessage:
          errorMessage != null ? errorMessage() : this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, profile, errorMessage];
}
