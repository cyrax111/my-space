import 'package:core_domain/core_domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/contact_message.dart';
import '../../domain/use_cases/send_contact_message.dart';
import 'contact_event.dart';
import 'contact_state.dart';

/// BLoC for the contact form.
class ContactBloc extends Bloc<ContactEvent, ContactState> {
  final SendContactMessage _sendContactMessage;

  ContactBloc({required SendContactMessage sendContactMessage})
      : _sendContactMessage = sendContactMessage,
        super(const ContactState.initial()) {
    on<ContactSubmitRequested>(_onSubmitRequested);
    on<ContactResetRequested>(_onResetRequested);
  }

  Future<void> _onSubmitRequested(
    ContactSubmitRequested event,
    Emitter<ContactState> emit,
  ) async {
    emit(const ContactState.submitting());

    final message = ContactMessage(
      name: event.name,
      email: event.email,
      subject: event.subject,
      message: event.message,
      sentAt: DateTime.now(),
    );

    try {
      await _sendContactMessage(message);
      emit(const ContactState.success());
    } on ValidationException catch (e) {
      emit(ContactState.error(
        message: e.message,
        fieldErrors: e.fieldErrors.isNotEmpty ? e.fieldErrors : null,
      ));
    } on AppException catch (e) {
      emit(ContactState.error(message: e.message));
    }
  }

  void _onResetRequested(
    ContactResetRequested event,
    Emitter<ContactState> emit,
  ) {
    emit(const ContactState.initial());
  }
}
