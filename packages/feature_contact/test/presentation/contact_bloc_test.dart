import 'package:bloc_test/bloc_test.dart';
import 'package:core_domain/core_domain.dart';
import 'package:feature_contact/feature_contact.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockSendContactMessage extends Mock implements SendContactMessage {}

void main() {
  late MockSendContactMessage mockSendContactMessage;

  setUp(() {
    mockSendContactMessage = MockSendContactMessage();
  });

  setUpAll(() {
    registerFallbackValue(const ContactMessage(
      name: '',
      email: '',
      subject: '',
      message: '',
    ));
  });

  ContactBloc buildBloc() =>
      ContactBloc(sendContactMessage: mockSendContactMessage);

  group('ContactSubmitRequested', () {
    blocTest<ContactBloc, ContactState>(
      'emits [submitting, success] when send succeeds',
      setUp: () {
        when(() => mockSendContactMessage(any()))
            .thenAnswer((_) async {});
      },
      build: buildBloc,
      act: (bloc) => bloc.add(const ContactEvent.submitRequested(
        name: 'Alex',
        email: 'alex@test.com',
        subject: 'Hello',
        message: 'This is a test message.',
      )),
      expect: () => [
        const ContactState(status: ContactStatus.submitting),
        const ContactState(status: ContactStatus.success),
      ],
    );

    blocTest<ContactBloc, ContactState>(
      'emits [submitting, error] when validation fails',
      setUp: () {
        when(() => mockSendContactMessage(any())).thenThrow(
          const ValidationException(
            'Name is required',
            fieldErrors: {'name': 'Name is required'},
          ),
        );
      },
      build: buildBloc,
      act: (bloc) => bloc.add(const ContactEvent.submitRequested(
        name: '',
        email: 'a@b.com',
        subject: 'Hi',
        message: 'Short test msg.',
      )),
      expect: () => [
        const ContactState(status: ContactStatus.submitting),
        isA<ContactState>()
            .having((s) => s.status, 'status', ContactStatus.error)
            .having((s) => s.errorMessage, 'errorMessage', isNotNull),
      ],
    );

    blocTest<ContactBloc, ContactState>(
      'error state includes field errors on validation failure',
      setUp: () {
        when(() => mockSendContactMessage(any())).thenThrow(
          const ValidationException(
            'Invalid email',
            fieldErrors: {'email': 'Invalid email'},
          ),
        );
      },
      build: buildBloc,
      act: (bloc) => bloc.add(const ContactEvent.submitRequested(
        name: 'Alex',
        email: 'bad',
        subject: 'Hi',
        message: 'A valid test message.',
      )),
      verify: (bloc) {
        final state = bloc.state;
        expect(state.status, ContactStatus.error);
        expect(state.fieldErrors, isNotNull);
        expect(state.fieldErrors!['email'], 'Invalid email');
      },
    );
  });

  group('ContactResetRequested', () {
    blocTest<ContactBloc, ContactState>(
      'resets to initial state',
      build: buildBloc,
      seed: () => const ContactState(status: ContactStatus.success),
      act: (bloc) => bloc.add(const ContactEvent.resetRequested()),
      expect: () => [
        const ContactState(),
      ],
    );
  });
}
