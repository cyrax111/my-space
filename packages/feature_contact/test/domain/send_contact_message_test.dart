import 'package:core_domain/core_domain.dart';
import 'package:feature_contact/feature_contact.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late SendContactMessage useCase;

  setUp(() {
    useCase = SendContactMessage();
  });

  test('succeeds with valid data', () async {
    // Should not throw
    await useCase(const ContactMessage(
      name: 'Alex',
      email: 'alex@example.com',
      subject: 'Hello',
      message: 'This is a valid test message with enough characters.',
    ));
  });

  test('fails when name is empty', () async {
    expect(
      () => useCase(const ContactMessage(
        name: '',
        email: 'alex@example.com',
        subject: 'Hello',
        message: 'This is a valid test message.',
      )),
      throwsA(isA<ValidationException>()),
    );
  });

  test('fails when email is invalid', () async {
    expect(
      () => useCase(const ContactMessage(
        name: 'Alex',
        email: 'not-an-email',
        subject: 'Hello',
        message: 'This is a valid test message.',
      )),
      throwsA(isA<ValidationException>()),
    );
  });

  test('fails when subject is empty', () async {
    expect(
      () => useCase(const ContactMessage(
        name: 'Alex',
        email: 'alex@example.com',
        subject: '',
        message: 'This is a valid test message.',
      )),
      throwsA(isA<ValidationException>()),
    );
  });

  test('fails when message is too short', () async {
    expect(
      () => useCase(const ContactMessage(
        name: 'Alex',
        email: 'alex@example.com',
        subject: 'Hello',
        message: 'Short',
      )),
      throwsA(isA<ValidationException>()),
    );
  });

  test('collects multiple validation errors', () async {
    try {
      await useCase(const ContactMessage(
        name: '',
        email: 'bad',
        subject: '',
        message: 'x',
      ));
      fail('Should have thrown');
    } on ValidationException catch (e) {
      expect(e.fieldErrors.length, greaterThanOrEqualTo(3));
    }
  });
}
