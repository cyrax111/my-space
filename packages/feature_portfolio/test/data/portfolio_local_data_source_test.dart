import 'package:feature_portfolio/feature_portfolio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PortfolioLocalDataSourceImpl', () {
    late PortfolioLocalDataSourceImpl dataSource;

    setUp(() {
      dataSource = PortfolioLocalDataSourceImpl();
    });

    test('getProjects returns non-empty list', () async {
      final projects = await dataSource.getProjects();
      expect(projects, isNotEmpty);
    });

    test('getProjects sorted by createdAt descending', () async {
      final projects = await dataSource.getProjects();
      for (var i = 1; i < projects.length; i++) {
        expect(
          projects[i - 1].createdAt.isAfter(projects[i].createdAt) ||
              projects[i - 1].createdAt.isAtSameMomentAs(projects[i].createdAt),
          isTrue,
        );
      }
    });

    test('getProjects filters by type', () async {
      final webProjects =
          await dataSource.getProjects(type: ProjectType.web);
      expect(webProjects, isNotEmpty);
      expect(webProjects.every((p) => p.type == ProjectType.web), isTrue);
    });

    test('getProjectById returns matching project', () async {
      final project = await dataSource.getProjectById('1');
      expect(project, isNotNull);
      expect(project!.id, '1');
    });

    test('getProjectById returns null for unknown id', () async {
      final project = await dataSource.getProjectById('nonexistent');
      expect(project, isNull);
    });
  });
}
