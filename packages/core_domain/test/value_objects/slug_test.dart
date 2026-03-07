import 'package:core_domain/core_domain.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Slug', () {
    test('creates valid slug', () {
      final slug = Slug('my-first-post');
      expect(slug.value, 'my-first-post');
    });

    test('trims and lowercases', () {
      final slug = Slug('  My-Post  ');
      expect(slug.value, 'my-post');
    });

    test('rejects empty string', () {
      expect(
        () => Slug(''),
        throwsA(isA<ValidationException>()),
      );
    });

    test('rejects special characters', () {
      expect(
        () => Slug('my post!'),
        throwsA(isA<ValidationException>()),
      );
    });

    test('rejects leading hyphens', () {
      expect(
        () => Slug('-my-post'),
        throwsA(isA<ValidationException>()),
      );
    });

    test('accepts single word', () {
      final slug = Slug('hello');
      expect(slug.value, 'hello');
    });

    test('tryCreate returns value for valid input', () {
      final slug = Slug.tryCreate('test');
      expect(slug, isNotNull);
      expect(slug!.value, 'test');
    });

    test('tryCreate returns null for invalid input', () {
      expect(Slug.tryCreate(''), isNull);
    });

    group('fromTitle', () {
      test('converts title to slug', () {
        final slug = Slug.fromTitle('My First Blog Post');
        expect(slug.value, 'my-first-blog-post');
      });

      test('strips special characters', () {
        final slug = Slug.fromTitle('Hello, World! (2024)');
        expect(slug.value, 'hello-world-2024');
      });

      test('collapses multiple spaces/hyphens', () {
        final slug = Slug.fromTitle('a   b---c');
        expect(slug.value, 'a-b-c');
      });

      test('handles empty input', () {
        final slug = Slug.fromTitle('');
        expect(slug.value, 'untitled');
      });
    });

    test('equality works', () {
      final a = Slug('test');
      final b = Slug('test');
      expect(a, equals(b));
    });
  });
}
