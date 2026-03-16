import 'package:freezed_annotation/freezed_annotation.dart';

part 'about_event.freezed.dart';

/// Events for the about BLoC.
@freezed
sealed class AboutEvent with _$AboutEvent {
  const factory AboutEvent.loadRequested() = AboutLoadRequested;
}
