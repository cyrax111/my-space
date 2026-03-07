import 'package:fpdart/fpdart.dart';

import '../failures/failure.dart';

/// URL-safe slug value object (e.g., "my-first-post").
///
/// Only allows lowercase alphanumeric characters and hyphens.
class Slug {
  final String value;

  const Slug._(this.value);

  /// Creates a validated [Slug].
  static Either<Failure, Slug> create(String input) {
    final trimmed = input.trim().toLowerCase();
    if (trimmed.isEmpty) {
      return left(
        const Failure.validation(errors: {'slug': 'Slug is required'}),
      );
    }
    if (!_slugRegex.hasMatch(trimmed)) {
      return left(
        const Failure.validation(
          errors: {
            'slug': 'Slug must contain only lowercase letters, numbers, and hyphens',
          },
        ),
      );
    }
    return right(Slug._(trimmed));
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
