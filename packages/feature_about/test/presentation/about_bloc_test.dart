import 'package:bloc_test/bloc_test.dart';
import 'package:feature_about/feature_about.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AboutBloc', () {
    blocTest<AboutBloc, AboutState>(
      'emits [loading, loaded] when loadRequested',
      build: () => AboutBloc(),
      act: (bloc) => bloc.add(const AboutEvent.loadRequested()),
      expect: () => [
        const AboutState(status: AboutStatus.loading),
        isA<AboutState>()
            .having((s) => s.status, 'status', AboutStatus.loaded)
            .having((s) => s.profile, 'profile', isNotNull),
      ],
    );

    blocTest<AboutBloc, AboutState>(
      'loaded state contains profile with expected data',
      build: () => AboutBloc(),
      act: (bloc) => bloc.add(const AboutEvent.loadRequested()),
      verify: (bloc) {
        final state = bloc.state;
        expect(state.status, AboutStatus.loaded);
        expect(state.profile, isNotNull);
        expect(state.profile!.name, 'Alexander Bosak');
        expect(state.profile!.skills, isNotEmpty);
        expect(state.profile!.experiences, isNotEmpty);
      },
    );
  });
}
