import '../failures/failure.dart';

/// Type-safe URL value object.
///
/// Validates that the input is a well-formed HTTP(S) URL.
/// Throws [ValidationException] if the input is invalid.
class UrlValue {
  final Uri uri;

  const UrlValue._(this.uri);

  /// Creates a validated [UrlValue].
  ///
  /// Throws [ValidationException] if the URL is invalid.
  factory UrlValue(String input) {
    final trimmed = input.trim();
    if (trimmed.isEmpty) {
      throw const ValidationException(
        'URL is required',
        fieldErrors: {'url': 'URL is required'},
      );
    }
    final uri = Uri.tryParse(trimmed);
    if (uri == null || !uri.hasScheme || !uri.hasAuthority) {
      throw const ValidationException(
        'Invalid URL format',
        fieldErrors: {'url': 'Invalid URL format'},
      );
    }
    if (uri.scheme != 'http' && uri.scheme != 'https') {
      throw const ValidationException(
        'URL must use HTTP or HTTPS',
        fieldErrors: {'url': 'URL must use HTTP or HTTPS'},
      );
    }
    return UrlValue._(uri);
  }

  /// Creates a validated [UrlValue], returning null if invalid.
  static UrlValue? tryCreate(String input) {
    try {
      return UrlValue(input);
    } on ValidationException {
      return null;
    }
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
