import 'package:core_domain/core_domain.dart';
import 'package:feature_contact/feature_contact.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late SendContactMessage useCase;

  setUp(() {
    useCase = SendContactMessage();
  });

  test('succeeds with valid data', () async {
    final result = await useCase(const ContactMessage(
      name: 'Alex',
      email: 'alex@example.com',
      subject: 'Hello',
      message: 'This is a valid test message with enough characters.',
    ));

    expect(result.isRight(), isTrue);
  });

  test('fails when name is empty', () async {
    final result = await useCase(const ContactMessage(
      name: '',
      email: 'alex@example.com',
      subject: 'Hello',
      message: 'This is a valid test message.',
    ));

    expect(result.isLeft(), isTrue);
    result.fold(
      (failure) {
        expect(failure, isA<ValidationFailure>());
      },
      (_) => fail('Should be left'),
    );
  });

  test('fails when email is invalid', () async {
    final result = await useCase(const ContactMessage(
      name: 'Alex',
      email: 'not-an-email',
      subject: 'Hello',
      message: 'This is a valid test message.',
    ));

    expect(result.isLeft(), isTrue);
  });

  test('fails when subject is empty', () async {
    final result = await useCase(const ContactMessage(
      name: 'Alex',
      email: 'alex@example.com',
      subject: '',
      message: 'This is a valid test message.',
    ));

    expect(result.isLeft(), isTrue);
  });

  test('fails when message is too short', () async {
    final result = await useCase(const ContactMessage(
      name: 'Alex',
      email: 'alex@example.com',
      subject: 'Hello',
      message: 'Short',
    ));

    expect(result.isLeft(), isTrue);
  });

  test('collects multiple validation errors', () async {
    final result = await useCase(const ContactMessage(
      name: '',
      email: 'bad',
      subject: '',
      message: 'x',
    ));

    expect(result.isLeft(), isTrue);
    result.fold(
      (failure) {
        expect(failure, isA<ValidationFailure>());
        final vf = failure as ValidationFailure;
        expect(vf.errors.length, greaterThanOrEqualTo(3));
      },
      (_) => fail('Should be left'),
    );
  });
}
