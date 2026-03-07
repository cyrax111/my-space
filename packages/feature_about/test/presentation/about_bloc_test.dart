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
        const AboutState.loading(),
        isA<AboutLoaded>(),
      ],
    );

    blocTest<AboutBloc, AboutState>(
      'loaded state contains profile with expected data',
      build: () => AboutBloc(),
      act: (bloc) => bloc.add(const AboutEvent.loadRequested()),
      verify: (bloc) {
        final state = bloc.state;
        expect(state, isA<AboutLoaded>());
        final loaded = state as AboutLoaded;
        expect(loaded.profile.name, 'Alexander Bosak');
        expect(loaded.profile.skills, isNotEmpty);
        expect(loaded.profile.experiences, isNotEmpty);
      },
    );
  });
}
