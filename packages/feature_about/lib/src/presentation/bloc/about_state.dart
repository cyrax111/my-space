import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/profile.dart';

part 'about_state.freezed.dart';

/// State for the about BLoC.
@freezed
sealed class AboutState with _$AboutState {
  const factory AboutState.initial() = AboutInitial;
  const factory AboutState.loading() = AboutLoading;
  const factory AboutState.loaded({required Profile profile}) = AboutLoaded;
  const factory AboutState.error({required String message}) = AboutError;
}
