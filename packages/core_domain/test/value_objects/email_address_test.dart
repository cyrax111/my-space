import 'package:core_domain/core_domain.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('EmailAddress', () {
    test('creates valid email', () {
      final email = EmailAddress('test@example.com');
      expect(email.value, 'test@example.com');
    });

    test('trims and lowercases input', () {
      final email = EmailAddress('  Test@Example.COM  ');
      expect(email.value, 'test@example.com');
    });

    test('rejects empty string', () {
      expect(
        () => EmailAddress(''),
        throwsA(isA<ValidationException>()),
      );
    });

    test('rejects whitespace-only string', () {
      expect(
        () => EmailAddress('   '),
        throwsA(isA<ValidationException>()),
      );
    });

    test('rejects invalid format (no @)', () {
      expect(
        () => EmailAddress('testexample.com'),
        throwsA(isA<ValidationException>()),
      );
    });

    test('rejects invalid format (no domain)', () {
      expect(
        () => EmailAddress('test@'),
        throwsA(isA<ValidationException>()),
      );
    });

    test('tryCreate returns value for valid email', () {
      final email = EmailAddress.tryCreate('a@b.com');
      expect(email, isNotNull);
      expect(email!.value, 'a@b.com');
    });

    test('tryCreate returns null for invalid email', () {
      expect(EmailAddress.tryCreate('bad'), isNull);
    });

    test('equality works for same emails', () {
      final a = EmailAddress('a@b.com');
      final b = EmailAddress('a@b.com');
      expect(a, equals(b));
    });

    test('inequality for different emails', () {
      final a = EmailAddress('a@b.com');
      final b = EmailAddress('c@d.com');
      expect(a, isNot(equals(b)));
    });

    test('toString returns value', () {
      final email = EmailAddress('a@b.com');
      expect(email.toString(), 'a@b.com');
    });
  });
}
