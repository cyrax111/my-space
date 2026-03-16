import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact_message.freezed.dart';

/// Contact form submission.
@freezed
class ContactMessage with _$ContactMessage {
  const factory ContactMessage({
    required String name,
    required String email,
    required String subject,
    required String message,
    DateTime? sentAt,
  }) = _ContactMessage;
}
