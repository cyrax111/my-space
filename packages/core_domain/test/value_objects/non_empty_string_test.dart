import 'package:core_domain/core_domain.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('NonEmptyString', () {
    test('creates valid non-empty string', () {
      final s = NonEmptyString('hello', fieldName: 'name');
      expect(s.value, 'hello');
    });

    test('trims whitespace', () {
      final s = NonEmptyString('  hello  ', fieldName: 'name');
      expect(s.value, 'hello');
    });

    test('rejects empty string', () {
      expect(
        () => NonEmptyString('', fieldName: 'name'),
        throwsA(isA<ValidationException>()),
      );
    });

    test('rejects whitespace-only string', () {
      expect(
        () => NonEmptyString('   ', fieldName: 'name'),
        throwsA(isA<ValidationException>()),
      );
    });

    test('respects maxLength', () {
      expect(
        () => NonEmptyString('toolong', fieldName: 'code', maxLength: 3),
        throwsA(isA<ValidationException>()),
      );
    });

    test('allows string at maxLength', () {
      final s = NonEmptyString('abc', fieldName: 'code', maxLength: 3);
      expect(s.value, 'abc');
    });

    test('tryCreate returns value for valid input', () {
      final s = NonEmptyString.tryCreate('test', fieldName: 'a');
      expect(s, isNotNull);
      expect(s!.value, 'test');
    });

    test('tryCreate returns null for invalid input', () {
      expect(NonEmptyString.tryCreate('', fieldName: 'a'), isNull);
    });

    test('equality works', () {
      final a = NonEmptyString('test', fieldName: 'a');
      final b = NonEmptyString('test', fieldName: 'b');
      expect(a, equals(b));
    });

    test('toString returns value', () {
      final s = NonEmptyString('hello', fieldName: 'x');
      expect(s.toString(), 'hello');
    });
  });
}
