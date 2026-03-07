import 'package:core_domain/core_domain.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('EmailAddress', () {
    test('creates valid email', () {
      final result = EmailAddress.create('test@example.com');
      expect(result.isRight(), isTrue);
      result.fold(
        (_) => fail('Should be right'),
        (email) => expect(email.value, 'test@example.com'),
      );
    });

    test('trims and lowercases input', () {
      final result = EmailAddress.create('  Test@Example.COM  ');
      expect(result.isRight(), isTrue);
      result.fold(
        (_) => fail('Should be right'),
        (email) => expect(email.value, 'test@example.com'),
      );
    });

    test('rejects empty string', () {
      final result = EmailAddress.create('');
      expect(result.isLeft(), isTrue);
    });

    test('rejects whitespace-only string', () {
      final result = EmailAddress.create('   ');
      expect(result.isLeft(), isTrue);
    });

    test('rejects invalid format (no @)', () {
      final result = EmailAddress.create('testexample.com');
      expect(result.isLeft(), isTrue);
    });

    test('rejects invalid format (no domain)', () {
      final result = EmailAddress.create('test@');
      expect(result.isLeft(), isTrue);
    });

    test('equality works for same emails', () {
      final a = EmailAddress.create('a@b.com').getOrElse((_) => throw '');
      final b = EmailAddress.create('a@b.com').getOrElse((_) => throw '');
      expect(a, equals(b));
    });

    test('inequality for different emails', () {
      final a = EmailAddress.create('a@b.com').getOrElse((_) => throw '');
      final b = EmailAddress.create('c@d.com').getOrElse((_) => throw '');
      expect(a, isNot(equals(b)));
    });

    test('toString returns value', () {
      final email = EmailAddress.create('a@b.com').getOrElse((_) => throw '');
      expect(email.toString(), 'a@b.com');
    });
  });
}
