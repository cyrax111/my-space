import 'package:freezed_annotation/freezed_annotation.dart';

part 'skill.freezed.dart';

/// Skill category.
enum SkillCategory {
  language,
  framework,
  tool,
  other,
}

/// A single skill with proficiency level.
@freezed
class Skill with _$Skill {
  const factory Skill({
    required String name,
    required SkillCategory category,
    /// Proficiency percentage (0–100).
    required double proficiency,
    String? iconUrl,
  }) = _Skill;
}
