import 'package:bloc_test/bloc_test.dart';
import 'package:core_domain/core_domain.dart';
import 'package:feature_portfolio/feature_portfolio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class MockGetProjects extends Mock implements GetProjects {}

void main() {
  late MockGetProjects mockGetProjects;

  setUp(() {
    mockGetProjects = MockGetProjects();
  });

  setUpAll(() {
    registerFallbackValue(const GetProjectsParams());
  });

  final sampleProject = Project(
    id: '1',
    title: 'Test Project',
    description: 'A test project',
    longDescription: 'A longer description',
    type: ProjectType.app,
    techStack: ['Flutter', 'Dart'],
    createdAt: DateTime(2024),
  );

  PortfolioBloc buildBloc() =>
      PortfolioBloc(getProjects: mockGetProjects);

  group('PortfolioLoadRequested', () {
    blocTest<PortfolioBloc, PortfolioState>(
      'emits [loading, loaded] when getProjects succeeds',
      setUp: () {
        when(() => mockGetProjects(any()))
            .thenAnswer((_) async => right([sampleProject]));
      },
      build: buildBloc,
      act: (bloc) => bloc.add(const PortfolioEvent.loadRequested()),
      expect: () => [
        const PortfolioState.loading(),
        PortfolioState.loaded(projects: [sampleProject]),
      ],
    );

    blocTest<PortfolioBloc, PortfolioState>(
      'emits [loading, error] when getProjects fails',
      setUp: () {
        when(() => mockGetProjects(any())).thenAnswer(
          (_) async => left(const Failure.network(message: 'offline')),
        );
      },
      build: buildBloc,
      act: (bloc) => bloc.add(const PortfolioEvent.loadRequested()),
      expect: () => [
        const PortfolioState.loading(),
        isA<PortfolioError>(),
      ],
    );

    blocTest<PortfolioBloc, PortfolioState>(
      'passes type filter to use case',
      setUp: () {
        when(() => mockGetProjects(any()))
            .thenAnswer((_) async => right([]));
      },
      build: buildBloc,
      act: (bloc) => bloc.add(
        const PortfolioEvent.loadRequested(type: ProjectType.web),
      ),
      verify: (_) {
        final captured =
            verify(() => mockGetProjects(captureAny())).captured;
        final params = captured.first as GetProjectsParams;
        expect(params.type, ProjectType.web);
      },
    );
  });

  group('PortfolioRefreshRequested', () {
    blocTest<PortfolioBloc, PortfolioState>(
      'reloads projects',
      setUp: () {
        when(() => mockGetProjects(any()))
            .thenAnswer((_) async => right([sampleProject]));
      },
      build: buildBloc,
      act: (bloc) => bloc.add(const PortfolioEvent.refreshRequested()),
      expect: () => [
        PortfolioState.loaded(projects: [sampleProject]),
      ],
    );
  });
}
