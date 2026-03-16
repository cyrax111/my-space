import 'package:core_domain/core_domain.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('UrlValue', () {
    test('creates valid HTTPS URL', () {
      final url = UrlValue('https://example.com');
      expect(url.value, 'https://example.com');
    });

    test('creates valid HTTP URL', () {
      final url = UrlValue('http://example.com/path');
      expect(url.value, 'http://example.com/path');
    });

    test('trims whitespace', () {
      final url = UrlValue('  https://example.com  ');
      expect(url.value, 'https://example.com');
    });

    test('rejects empty string', () {
      expect(
        () => UrlValue(''),
        throwsA(isA<ValidationException>()),
      );
    });

    test('rejects non-HTTP scheme', () {
      expect(
        () => UrlValue('ftp://files.example.com'),
        throwsA(isA<ValidationException>()),
      );
    });

    test('rejects malformed URL', () {
      expect(
        () => UrlValue('not-a-url'),
        throwsA(isA<ValidationException>()),
      );
    });

    test('tryCreate returns value for valid URL', () {
      final url = UrlValue.tryCreate('https://a.com');
      expect(url, isNotNull);
    });

    test('tryCreate returns null for invalid URL', () {
      expect(UrlValue.tryCreate('bad'), isNull);
    });

    test('equality works', () {
      final a = UrlValue('https://a.com');
      final b = UrlValue('https://a.com');
      expect(a, equals(b));
    });

    test('toString returns URL string', () {
      final url = UrlValue('https://example.com');
      expect(url.toString(), 'https://example.com');
    });
  });
}
