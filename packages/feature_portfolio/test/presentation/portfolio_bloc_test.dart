import 'package:bloc_test/bloc_test.dart';
import 'package:core_domain/core_domain.dart';
import 'package:feature_portfolio/feature_portfolio.dart';
import 'package:flutter_test/flutter_test.dart';
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
            .thenAnswer((_) async => [sampleProject]);
      },
      build: buildBloc,
      act: (bloc) => bloc.add(const PortfolioEvent.loadRequested()),
      expect: () => [
        const PortfolioState(status: PortfolioStatus.loading),
        PortfolioState(
          status: PortfolioStatus.loaded,
          projects: [sampleProject],
        ),
      ],
    );

    blocTest<PortfolioBloc, PortfolioState>(
      'emits [loading, error] when getProjects fails',
      setUp: () {
        when(() => mockGetProjects(any()))
            .thenThrow(const NetworkException('offline'));
      },
      build: buildBloc,
      act: (bloc) => bloc.add(const PortfolioEvent.loadRequested()),
      expect: () => [
        const PortfolioState(status: PortfolioStatus.loading),
        isA<PortfolioState>()
            .having((s) => s.status, 'status', PortfolioStatus.error)
            .having((s) => s.errorMessage, 'errorMessage', isNotNull),
      ],
    );

    blocTest<PortfolioBloc, PortfolioState>(
      'passes type filter to use case',
      setUp: () {
        when(() => mockGetProjects(any()))
            .thenAnswer((_) async => []);
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
            .thenAnswer((_) async => [sampleProject]);
      },
      build: buildBloc,
      seed: () => const PortfolioState(status: PortfolioStatus.loaded),
      act: (bloc) => bloc.add(const PortfolioEvent.refreshRequested()),
      expect: () => [
        PortfolioState(
          status: PortfolioStatus.loaded,
          projects: [sampleProject],
        ),
      ],
    );

    blocTest<PortfolioBloc, PortfolioState>(
      'preserves projects on refresh failure',
      setUp: () {
        when(() => mockGetProjects(any()))
            .thenThrow(const NetworkException('offline'));
      },
      build: buildBloc,
      seed: () => PortfolioState(
        status: PortfolioStatus.loaded,
        projects: [sampleProject],
      ),
      act: (bloc) => bloc.add(const PortfolioEvent.refreshRequested()),
      expect: () => [
        isA<PortfolioState>()
            .having((s) => s.status, 'status', PortfolioStatus.error)
            .having((s) => s.projects, 'projects', [sampleProject])
            .having((s) => s.errorMessage, 'errorMessage', isNotNull),
      ],
    );
  });
}
