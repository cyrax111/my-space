import '../failures/failure.dart';

/// A string that is guaranteed to be non-empty after trimming.
///
/// Throws [ValidationException] if the input is empty or exceeds [maxLength].
class NonEmptyString {
  final String value;

  const NonEmptyString._(this.value);

  /// Creates a validated [NonEmptyString].
  ///
  /// [fieldName] is used in the validation error message.
  /// Throws [ValidationException] if validation fails.
  factory NonEmptyString(
    String input, {
    String fieldName = 'field',
    int? maxLength,
  }) {
    final trimmed = input.trim();
    if (trimmed.isEmpty) {
      throw ValidationException(
        '$fieldName is required',
        fieldErrors: {fieldName: '$fieldName is required'},
      );
    }
    if (maxLength != null && trimmed.length > maxLength) {
      throw ValidationException(
        '$fieldName must be $maxLength characters or less',
        fieldErrors: {
          fieldName: '$fieldName must be $maxLength characters or less',
        },
      );
    }
    return NonEmptyString._(trimmed);
  }

  /// Creates a validated [NonEmptyString], returning null if invalid.
  static NonEmptyString? tryCreate(
    String input, {
    String fieldName = 'field',
    int? maxLength,
  }) {
    try {
      return NonEmptyString(input, fieldName: fieldName, maxLength: maxLength);
    } on ValidationException {
      return null;
    }
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NonEmptyString && value == other.value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}
