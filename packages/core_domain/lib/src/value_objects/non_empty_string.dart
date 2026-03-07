import 'package:fpdart/fpdart.dart';

import '../failures/failure.dart';

/// A string that is guaranteed to be non-empty after trimming.
class NonEmptyString {
  final String value;

  const NonEmptyString._(this.value);

  /// Creates a validated [NonEmptyString].
  ///
  /// [fieldName] is used in the validation error message.
  static Either<Failure, NonEmptyString> create(
    String input, {
    String fieldName = 'field',
    int? maxLength,
  }) {
    final trimmed = input.trim();
    if (trimmed.isEmpty) {
      return left(
        Failure.validation(errors: {fieldName: '$fieldName is required'}),
      );
    }
    if (maxLength != null && trimmed.length > maxLength) {
      return left(
        Failure.validation(
          errors: {fieldName: '$fieldName must be $maxLength characters or less'},
        ),
      );
    }
    return right(NonEmptyString._(trimmed));
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
