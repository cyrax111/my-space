import 'package:fpdart/fpdart.dart';

import '../failures/failure.dart';

/// Type-safe URL value object.
///
/// Validates that the input is a well-formed HTTP(S) URL.
class UrlValue {
  final Uri uri;

  const UrlValue._(this.uri);

  /// Creates a validated [UrlValue].
  static Either<Failure, UrlValue> create(String input) {
    final trimmed = input.trim();
    if (trimmed.isEmpty) {
      return left(
        const Failure.validation(errors: {'url': 'URL is required'}),
      );
    }
    final uri = Uri.tryParse(trimmed);
    if (uri == null || !uri.hasScheme || !uri.hasAuthority) {
      return left(
        const Failure.validation(errors: {'url': 'Invalid URL format'}),
      );
    }
    if (uri.scheme != 'http' && uri.scheme != 'https') {
      return left(
        const Failure.validation(errors: {'url': 'URL must use HTTP or HTTPS'}),
      );
    }
    return right(UrlValue._(uri));
  }

  String get value => uri.toString();

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is UrlValue && uri == other.uri;

  @override
  int get hashCode => uri.hashCode;

  @override
  String toString() => value;
}
