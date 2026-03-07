import 'package:core_domain/core_domain.dart';
import 'package:fpdart/fpdart.dart';

import '../entities/contact_message.dart';

/// Validates and sends a contact form message.
///
/// Currently simulates sending — a real implementation would
/// call an API endpoint or send an email.
class SendContactMessage extends UseCase<void, ContactMessage> {
  @override
  Future<Either<Failure, void>> call(ContactMessage params) async {
    // Validate fields
    final errors = <String, String>{};

    if (params.name.trim().isEmpty) {
      errors['name'] = 'Name is required';
    }

    final emailResult = EmailAddress.create(params.email);
    if (emailResult.isLeft()) {
      errors['email'] = 'Please enter a valid email address';
    }

    if (params.subject.trim().isEmpty) {
      errors['subject'] = 'Subject is required';
    }

    if (params.message.trim().length < 10) {
      errors['message'] = 'Message must be at least 10 characters';
    }

    if (errors.isNotEmpty) {
      return left(Failure.validation(errors: errors));
    }

    // Simulate network delay
    await Future<void>.delayed(const Duration(seconds: 1));

    return right(null);
  }
}
