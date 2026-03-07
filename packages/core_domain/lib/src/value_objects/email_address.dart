import 'package:fpdart/fpdart.dart';

import '../failures/failure.dart';

/// Type-safe email address value object.
///
/// Validates the email format on creation.
/// Use [EmailAddress.create] to safely construct.
class EmailAddress {
  final String value;

  const EmailAddress._(this.value);

  /// Creates a validated [EmailAddress].
  ///
  /// Returns [Left(Failure.validation)] if the email is invalid.
  static Either<Failure, EmailAddress> create(String input) {
    final trimmed = input.trim().toLowerCase();
    if (trimmed.isEmpty) {
      return left(
        const Failure.validation(errors: {'email': 'Email is required'}),
      );
    }
    if (!_emailRegex.hasMatch(trimmed)) {
      return left(
        const Failure.validation(errors: {'email': 'Invalid email format'}),
      );
    }
    return right(EmailAddress._(trimmed));
  }

  static final _emailRegex = RegExp(
    r'^[a-zA-Z0-9.!#$%&*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$',
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is EmailAddress && value == other.value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}
