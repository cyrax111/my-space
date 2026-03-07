import 'package:core_domain/core_domain.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('NonEmptyString', () {
    test('creates valid non-empty string', () {
      final result = NonEmptyString.create('hello', fieldName: 'name');
      expect(result.isRight(), isTrue);
      result.fold(
        (_) => fail('Should be right'),
        (s) => expect(s.value, 'hello'),
      );
    });

    test('trims whitespace', () {
      final result = NonEmptyString.create('  hello  ', fieldName: 'name');
      expect(result.isRight(), isTrue);
      result.fold(
        (_) => fail('Should be right'),
        (s) => expect(s.value, 'hello'),
      );
    });

    test('rejects empty string', () {
      final result = NonEmptyString.create('', fieldName: 'name');
      expect(result.isLeft(), isTrue);
    });

    test('rejects whitespace-only string', () {
      final result = NonEmptyString.create('   ', fieldName: 'name');
      expect(result.isLeft(), isTrue);
    });

    test('respects maxLength', () {
      final result =
          NonEmptyString.create('toolong', fieldName: 'code', maxLength: 3);
      expect(result.isLeft(), isTrue);
    });

    test('allows string at maxLength', () {
      final result =
          NonEmptyString.create('abc', fieldName: 'code', maxLength: 3);
      expect(result.isRight(), isTrue);
    });

    test('equality works', () {
      final a =
          NonEmptyString.create('test', fieldName: 'a').getOrElse((_) => throw '');
      final b =
          NonEmptyString.create('test', fieldName: 'b').getOrElse((_) => throw '');
      expect(a, equals(b));
    });

    test('toString returns value', () {
      final s =
          NonEmptyString.create('hello', fieldName: 'x').getOrElse((_) => throw '');
      expect(s.toString(), 'hello');
    });
  });
}
