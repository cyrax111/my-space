import '../failures/failure.dart';

/// URL-safe slug value object (e.g., "my-first-post").
///
/// Only allows lowercase alphanumeric characters and hyphens.
/// Throws [ValidationException] if the input is invalid.
class Slug {
  final String value;

  const Slug._(this.value);

  /// Creates a validated [Slug].
  ///
  /// Throws [ValidationException] if the slug is invalid.
  factory Slug(String input) {
    final trimmed = input.trim().toLowerCase();
    if (trimmed.isEmpty) {
      throw const ValidationException(
        'Slug is required',
        fieldErrors: {'slug': 'Slug is required'},
      );
    }
    if (!_slugRegex.hasMatch(trimmed)) {
      throw const ValidationException(
        'Slug must contain only lowercase letters, numbers, and hyphens',
        fieldErrors: {
          'slug':
              'Slug must contain only lowercase letters, numbers, and hyphens',
        },
      );
    }
    return Slug._(trimmed);
  }

  /// Creates a validated [Slug], returning null if invalid.
  static Slug? tryCreate(String input) {
    try {
      return Slug(input);
    } on ValidationException {
      return null;
    }
  }

  /// Generates a slug from a title string.
  static Slug fromTitle(String title) {
    final slug = title
        .trim()
        .toLowerCase()
        .replaceAll(RegExp(r'[^a-z0-9\s-]'), '')
        .replaceAll(RegExp(r'[\s]+'), '-')
        .replaceAll(RegExp(r'-+'), '-')
        .replaceAll(RegExp(r'^-|-$'), '');
    return Slug._(slug.isEmpty ? 'untitled' : slug);
  }

  static final _slugRegex = RegExp(r'^[a-z0-9]+(?:-[a-z0-9]+)*$');

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Slug && value == other.value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}
