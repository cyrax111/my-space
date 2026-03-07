import '../../domain/entities/project.dart';

/// Data transfer model for [Project].
class ProjectModel {
  final String id;
  final String title;
  final String description;
  final String longDescription;
  final ProjectType type;
  final List<String> techStack;
  final DateTime createdAt;
  final String? imageUrl;
  final String? liveUrl;
  final String? repoUrl;
  final bool isFeatured;

  const ProjectModel({
    required this.id,
    required this.title,
    required this.description,
    required this.longDescription,
    required this.type,
    required this.techStack,
    required this.createdAt,
    this.imageUrl,
    this.liveUrl,
    this.repoUrl,
    this.isFeatured = false,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      longDescription: json['long_description'] as String,
      type: ProjectType.values.byName(json['type'] as String),
      techStack: (json['tech_stack'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      createdAt: DateTime.parse(json['created_at'] as String),
      imageUrl: json['image_url'] as String?,
      liveUrl: json['live_url'] as String?,
      repoUrl: json['repo_url'] as String?,
      isFeatured: json['is_featured'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'long_description': longDescription,
        'type': type.name,
        'tech_stack': techStack,
        'created_at': createdAt.toIso8601String(),
        'image_url': imageUrl,
        'live_url': liveUrl,
        'repo_url': repoUrl,
        'is_featured': isFeatured,
      };

  Project toEntity() => Project(
        id: id,
        title: title,
        description: description,
        longDescription: longDescription,
        type: type,
        techStack: techStack,
        createdAt: createdAt,
        imageUrl: imageUrl,
        liveUrl: liveUrl,
        repoUrl: repoUrl,
        isFeatured: isFeatured,
      );
}
