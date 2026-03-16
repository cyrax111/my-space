import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/profile.dart';

part 'about_state.freezed.dart';

/// Status of the about feature.
enum AboutStatus { initial, loading, loaded, error }

/// State for the about BLoC.
///
/// Uses a single concrete class with a status enum.
@freezed
class AboutState with _$AboutState {
  const factory AboutState({
    @Default(AboutStatus.initial) AboutStatus status,
    Profile? profile,
    String? errorMessage,
  }) = _AboutState;
}
