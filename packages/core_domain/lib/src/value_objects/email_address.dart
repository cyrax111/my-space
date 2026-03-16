import '../failures/failure.dart';

/// Type-safe email address value object.
///
/// Validates the email format on creation.
/// Throws [ValidationException] if the input is invalid.
class EmailAddress {
  final String value;

  const EmailAddress._(this.value);

  /// Creates a validated [EmailAddress].
  ///
  /// Throws [ValidationException] if the email is invalid.
  factory EmailAddress(String input) {
    final trimmed = input.trim().toLowerCase();
    if (trimmed.isEmpty) {
      throw const ValidationException(
        'Email is required',
        fieldErrors: {'email': 'Email is required'},
      );
    }
    if (!_emailRegex.hasMatch(trimmed)) {
      throw const ValidationException(
        'Invalid email format',
        fieldErrors: {'email': 'Invalid email format'},
      );
    }
    return EmailAddress._(trimmed);
  }

  /// Creates a validated [EmailAddress], returning null if invalid.
  static EmailAddress? tryCreate(String input) {
    try {
      return EmailAddress(input);
    } on ValidationException {
      return null;
    }
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
