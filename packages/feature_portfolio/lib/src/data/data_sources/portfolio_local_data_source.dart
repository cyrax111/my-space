import '../../domain/entities/project.dart';
import '../models/project_model.dart';

/// Local data source for portfolio projects.
abstract class PortfolioLocalDataSource {
  Future<List<ProjectModel>> getProjects({ProjectType? type});
  Future<ProjectModel?> getProjectById(String id);
}

/// In-memory implementation with sample data.
class PortfolioLocalDataSourceImpl implements PortfolioLocalDataSource {
  final List<ProjectModel> _projects = _sampleProjects;

  @override
  Future<List<ProjectModel>> getProjects({ProjectType? type}) async {
    var results = List<ProjectModel>.from(_projects);
    if (type != null) {
      results = results.where((p) => p.type == type).toList();
    }
    results.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return results;
  }

  @override
  Future<ProjectModel?> getProjectById(String id) async {
    try {
      return _projects.firstWhere((p) => p.id == id);
    } catch (_) {
      return null;
    }
  }
}

// ─── Sample Data ──────────────────────────────────────────

final _now = DateTime.now();

final List<ProjectModel> _sampleProjects = [
  ProjectModel(
    id: '1',
    title: 'My Space',
    description: 'Personal portfolio & blog built with Flutter',
    longDescription:
        'A cross-platform personal site built with Flutter, featuring '
        'Clean Architecture, BLoC state management, adaptive responsive '
        'layouts, and a feature-first monorepo structure. Deploys to '
        'web, Android, and iOS from a single codebase.',
    type: ProjectType.web,
    techStack: ['Flutter', 'Dart', 'BLoC', 'GoRouter', 'Melos'],
    createdAt: _now.subtract(const Duration(days: 5)),
    repoUrl: 'https://github.com/cyrax111/my-space',
    isFeatured: true,
  ),
  ProjectModel(
    id: '2',
    title: 'value_t',
    description: 'Dart value types with no code generation',
    longDescription:
        'A Dart package that provides value types (immutable data classes) '
        'without code generation. Supports equality, hashCode, toString, '
        'and copyWith out of the box. Published on pub.dev.',
    type: ProjectType.package,
    techStack: ['Dart', 'pub.dev'],
    createdAt: _now.subtract(const Duration(days: 180)),
    repoUrl: 'https://github.com/cyrax111/value_t',
    liveUrl: 'https://pub.dev/packages/value_t',
    isFeatured: true,
  ),
  ProjectModel(
    id: '3',
    title: 'Weather Dashboard',
    description: 'Real-time weather app with multiple city support',
    longDescription:
        'A Flutter app that shows real-time weather data for multiple cities. '
        'Features include hourly and 7-day forecasts, location search, '
        'animated weather icons, and offline caching. '
        'Built with Clean Architecture and BLoC pattern.',
    type: ProjectType.app,
    techStack: ['Flutter', 'Dart', 'BLoC', 'REST API', 'Hive'],
    createdAt: _now.subtract(const Duration(days: 90)),
    isFeatured: false,
  ),
  ProjectModel(
    id: '4',
    title: 'Dart CLI Tools',
    description: 'Collection of productivity CLI tools in Dart',
    longDescription:
        'A suite of command-line tools built with Dart for developer '
        'productivity. Includes a project scaffolder, code formatter wrapper, '
        'and a dependency analyzer. Published as global Dart packages.',
    type: ProjectType.openSource,
    techStack: ['Dart', 'CLI', 'args', 'pub.dev'],
    createdAt: _now.subtract(const Duration(days: 120)),
    repoUrl: 'https://github.com/cyrax111/dart-cli-tools',
    isFeatured: false,
  ),
];
