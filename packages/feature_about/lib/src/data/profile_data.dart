import '../domain/entities/experience.dart';
import '../domain/entities/profile.dart';
import '../domain/entities/skill.dart';

/// Static profile data.
///
/// In a production app, this would come from a CMS or API.
/// For the initial version, we define it here.
Profile getSampleProfile() => Profile(
      name: 'Alexander Bosak',
      title: 'Flutter & Mobile Developer',
      bio:
          'Passionate about building beautiful, performant cross-platform '
          'applications with Flutter. I love clean architecture, well-tested '
          'code, and creating delightful user experiences. Based in Dubai, '
          'building for the world.',
      location: 'Dubai, UAE',
      socialLinks: const SocialLinks(
        github: 'https://github.com/cyrax111',
        telegram: 'https://t.me/Cyrax111',
        email: 'mailto:alex@example.com',
      ),
      skills: const [
        Skill(
          name: 'Flutter',
          category: SkillCategory.framework,
          proficiency: 95,
        ),
        Skill(
          name: 'Dart',
          category: SkillCategory.language,
          proficiency: 92,
        ),
        Skill(
          name: 'Clean Architecture',
          category: SkillCategory.other,
          proficiency: 90,
        ),
        Skill(
          name: 'BLoC / Riverpod',
          category: SkillCategory.framework,
          proficiency: 88,
        ),
        Skill(
          name: 'Firebase',
          category: SkillCategory.tool,
          proficiency: 85,
        ),
        Skill(
          name: 'Git / CI-CD',
          category: SkillCategory.tool,
          proficiency: 85,
        ),
        Skill(
          name: 'REST & GraphQL APIs',
          category: SkillCategory.other,
          proficiency: 82,
        ),
        Skill(
          name: 'SQL / NoSQL',
          category: SkillCategory.tool,
          proficiency: 78,
        ),
      ],
      experiences: [
        Experience(
          title: 'Senior Flutter Developer',
          company: 'Freelance',
          startDate: DateTime(2022, 1),
          description:
              'Building cross-platform mobile and web applications for '
              'various clients. Specializing in clean architecture, '
              'performance optimization, and adaptive UI.',
          technologies: [
            'Flutter',
            'Dart',
            'Firebase',
            'BLoC',
            'Clean Architecture',
          ],
        ),
        Experience(
          title: 'Mobile Developer',
          company: 'Tech Company',
          startDate: DateTime(2019, 6),
          endDate: DateTime(2021, 12),
          description:
              'Developed and maintained multiple Flutter applications. '
              'Led migration from native Android/iOS to Flutter.',
          technologies: ['Flutter', 'Dart', 'Android', 'iOS', 'REST APIs'],
        ),
        Experience(
          title: 'Junior Developer',
          company: 'Startup',
          startDate: DateTime(2017, 3),
          endDate: DateTime(2019, 5),
          description:
              'Full-stack development with focus on mobile applications. '
              'Started learning Flutter in its early days.',
          technologies: ['Android', 'Kotlin', 'Java', 'Flutter'],
        ),
      ],
    );
