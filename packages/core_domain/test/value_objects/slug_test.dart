import 'package:core_domain/core_domain.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Slug', () {
    test('creates valid slug', () {
      final result = Slug.create('my-first-post');
      expect(result.isRight(), isTrue);
      result.fold(
        (_) => fail('Should be right'),
        (slug) => expect(slug.value, 'my-first-post'),
      );
    });

    test('trims and lowercases', () {
      final result = Slug.create('  My-Post  ');
      expect(result.isRight(), isTrue);
      result.fold(
        (_) => fail('Should be right'),
        (slug) => expect(slug.value, 'my-post'),
      );
    });

    test('rejects empty string', () {
      final result = Slug.create('');
      expect(result.isLeft(), isTrue);
    });

    test('rejects special characters', () {
      final result = Slug.create('my post!');
      expect(result.isLeft(), isTrue);
    });

    test('rejects leading hyphens', () {
      final result = Slug.create('-my-post');
      expect(result.isLeft(), isTrue);
    });

    test('accepts single word', () {
      final result = Slug.create('hello');
      expect(result.isRight(), isTrue);
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
      final a = Slug.create('test').getOrElse((_) => throw '');
      final b = Slug.create('test').getOrElse((_) => throw '');
      expect(a, equals(b));
    });
  });
}
