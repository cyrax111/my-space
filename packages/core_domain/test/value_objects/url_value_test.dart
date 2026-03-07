import 'package:core_domain/core_domain.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('UrlValue', () {
    test('creates valid HTTPS URL', () {
      final result = UrlValue.create('https://example.com');
      expect(result.isRight(), isTrue);
      result.fold(
        (_) => fail('Should be right'),
        (url) => expect(url.value, 'https://example.com'),
      );
    });

    test('creates valid HTTP URL', () {
      final result = UrlValue.create('http://example.com/path');
      expect(result.isRight(), isTrue);
    });

    test('trims whitespace', () {
      final result = UrlValue.create('  https://example.com  ');
      expect(result.isRight(), isTrue);
    });

    test('rejects empty string', () {
      final result = UrlValue.create('');
      expect(result.isLeft(), isTrue);
    });

    test('rejects non-HTTP scheme', () {
      final result = UrlValue.create('ftp://files.example.com');
      expect(result.isLeft(), isTrue);
    });

    test('rejects malformed URL', () {
      final result = UrlValue.create('not-a-url');
      expect(result.isLeft(), isTrue);
    });

    test('equality works', () {
      final a = UrlValue.create('https://a.com').getOrElse((_) => throw '');
      final b = UrlValue.create('https://a.com').getOrElse((_) => throw '');
      expect(a, equals(b));
    });

    test('toString returns URL string', () {
      final url =
          UrlValue.create('https://example.com').getOrElse((_) => throw '');
      expect(url.toString(), 'https://example.com');
    });
  });
}
