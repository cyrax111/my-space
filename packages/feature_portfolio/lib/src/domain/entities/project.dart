import 'package:freezed_annotation/freezed_annotation.dart';

part 'project.freezed.dart';

/// Type of project.
enum ProjectType {
  app,
  web,
  package,
  openSource,
}

/// Immutable portfolio project entity.
@freezed
class Project with _$Project {
  const Project._();

  const factory Project({
    required String id,
    required String title,
    required String description,
    required String longDescription,
    required ProjectType type,
    required List<String> techStack,
    required DateTime createdAt,
    String? imageUrl,
    String? liveUrl,
    String? repoUrl,
    @Default(false) bool isFeatured,
  }) = _Project;

  /// Short comma-separated tech stack display.
  String get techStackDisplay => techStack.join(', ');
}
