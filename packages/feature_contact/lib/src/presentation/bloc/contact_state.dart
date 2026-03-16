import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact_state.freezed.dart';

/// Status of the contact form.
enum ContactStatus { initial, submitting, success, error }

/// State for the contact BLoC.
///
/// Uses a single concrete class with a status enum.
@freezed
class ContactState with _$ContactState {
  const factory ContactState({
    @Default(ContactStatus.initial) ContactStatus status,
    String? errorMessage,
    Map<String, String>? fieldErrors,
  }) = _ContactState;
}
