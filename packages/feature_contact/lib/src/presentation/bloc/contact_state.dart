import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact_state.freezed.dart';

/// State for the contact BLoC.
@freezed
sealed class ContactState with _$ContactState {
  /// Ready for input.
  const factory ContactState.initial() = ContactInitial;

  /// Form is being submitted.
  const factory ContactState.submitting() = ContactSubmitting;

  /// Message sent successfully.
  const factory ContactState.success() = ContactSuccess;

  /// Validation or submission error.
  const factory ContactState.error({
    required String message,
    Map<String, String>? fieldErrors,
  }) = ContactError;
}
