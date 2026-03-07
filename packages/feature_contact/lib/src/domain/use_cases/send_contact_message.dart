import 'package:core_domain/core_domain.dart';

import '../entities/contact_message.dart';

/// Validates and sends a contact form message.
///
/// Currently simulates sending — a real implementation would
/// call an API endpoint or send an email.
///
/// Throws [ValidationException] if fields are invalid.
class SendContactMessage extends UseCase<void, ContactMessage> {
  @override
  Future<void> call(ContactMessage params) async {
    // Validate fields
    final errors = <String, String>{};

    if (params.name.trim().isEmpty) {
      errors['name'] = 'Name is required';
    }

    if (EmailAddress.tryCreate(params.email) == null) {
      errors['email'] = 'Please enter a valid email address';
    }

    if (params.subject.trim().isEmpty) {
      errors['subject'] = 'Subject is required';
    }

    if (params.message.trim().length < 10) {
      errors['message'] = 'Message must be at least 10 characters';
    }

    if (errors.isNotEmpty) {
      throw ValidationException(
        errors.values.first,
        fieldErrors: errors,
      );
    }

    // Simulate network delay
    await Future<void>.delayed(const Duration(seconds: 1));
  }
}
