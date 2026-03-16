import 'package:equatable/equatable.dart';

/// Status of the contact form.
enum ContactStatus { initial, submitting, success, error }

/// State for the contact BLoC.
///
/// Uses the concrete-class + status-enum pattern.
class ContactState extends Equatable {
  final ContactStatus status;
  final String? errorMessage;
  final Map<String, String>? fieldErrors;

  const ContactState({
    this.status = ContactStatus.initial,
    this.errorMessage,
    this.fieldErrors,
  });

  ContactState copyWith({
    ContactStatus? status,
    String? Function()? errorMessage,
    Map<String, String>? Function()? fieldErrors,
  }) {
    return ContactState(
      status: status ?? this.status,
      errorMessage:
          errorMessage != null ? errorMessage() : this.errorMessage,
      fieldErrors:
          fieldErrors != null ? fieldErrors() : this.fieldErrors,
    );
  }

  @override
  List<Object?> get props => [status, errorMessage, fieldErrors];
}
