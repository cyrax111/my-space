import 'package:freezed_annotation/freezed_annotation.dart';

import 'experience.dart';
import 'skill.dart';

part 'profile.freezed.dart';

/// Social media links.
@freezed
class SocialLinks with _$SocialLinks {
  const factory SocialLinks({
    String? github,
    String? linkedin,
    String? twitter,
    String? telegram,
    String? email,
    String? website,
  }) = _SocialLinks;
}

/// Complete user profile for the about page.
@freezed
class Profile with _$Profile {
  const factory Profile({
    required String name,
    required String title,
    required String bio,
    required String location,
    required List<Skill> skills,
    required List<Experience> experiences,
    required SocialLinks socialLinks,
    String? avatarUrl,
    String? resumeUrl,
  }) = _Profile;
}
