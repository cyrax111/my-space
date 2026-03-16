import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact_event.freezed.dart';

/// Events for the contact BLoC.
@freezed
sealed class ContactEvent with _$ContactEvent {
  /// Submit the contact form.
  const factory ContactEvent.submitRequested({
    required String name,
    required String email,
    required String subject,
    required String message,
  }) = ContactSubmitRequested;

  /// Reset form to initial state.
  const factory ContactEvent.resetRequested() = ContactResetRequested;
}
