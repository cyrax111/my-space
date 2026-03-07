import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/experience.dart';
import '../../domain/entities/profile.dart';
import '../../domain/entities/skill.dart';
import '../bloc/about_bloc.dart';
import '../bloc/about_event.dart';
import '../bloc/about_state.dart';

/// About page — personal info, skills, and experience timeline.
class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AboutBloc, AboutState>(
      builder: (context, state) => switch (state) {
        AboutInitial() => const LoadingIndicator(message: 'Loading...'),
        AboutLoading() => const LoadingIndicator(message: 'Loading...'),
        AboutError(:final message) => ErrorView(
            message: message,
            onRetry: () => context
                .read<AboutBloc>()
                .add(const AboutEvent.loadRequested()),
          ),
        AboutLoaded(:final profile) => _ProfileContent(profile: profile),
      },
    );
  }
}

class _ProfileContent extends StatelessWidget {
  final Profile profile;

  const _ProfileContent({required this.profile});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return CustomScrollView(
      slivers: [
        // Hero section
        SliverAdaptivePadding(
          sliver: SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: AppSpacing.xl),
              child: ResponsiveBuilder(
                compact: (_) => _HeroCompact(profile: profile),
                expanded: (_) => _HeroExpanded(profile: profile),
              ),
            ),
          ),
        ),

        // Bio
        SliverAdaptivePadding(
          sliver: SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.xl),
              child: Text(
                profile.bio,
                style: theme.textTheme.bodyLarge?.copyWith(height: 1.8),
              ),
            ),
          ),
        ),

        // Skills section
        SliverAdaptivePadding(
          sliver: SliverToBoxAdapter(
            child: SectionHeader(
              title: 'Skills',
              subtitle: '${profile.skills.length} technologies',
            ),
          ),
        ),
        SliverAdaptivePadding(
          sliver: SliverToBoxAdapter(
            child: _SkillsGrid(skills: profile.skills),
          ),
        ),

        // Experience section
        SliverAdaptivePadding(
          sliver: SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: AppSpacing.xl),
              child: SectionHeader(
                title: 'Experience',
                subtitle: '${profile.experiences.length} positions',
              ),
            ),
          ),
        ),
        SliverAdaptivePadding(
          sliver: SliverList.builder(
            itemCount: profile.experiences.length,
            itemBuilder: (context, index) => _ExperienceCard(
              experience: profile.experiences[index],
              isLast: index == profile.experiences.length - 1,
            ),
          ),
        ),

        const SliverToBoxAdapter(
          child: SizedBox(height: AppSpacing.xxl),
        ),
      ],
    );
  }
}

// ─── Hero Layouts ──────────────────────────────────────

class _HeroCompact extends StatelessWidget {
  final Profile profile;
  const _HeroCompact({required this.profile});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        // Avatar
        CircleAvatar(
          radius: 56,
          backgroundColor: theme.colorScheme.primary.withValues(alpha: 0.1),
          child: Text(
            profile.name.split(' ').map((n) => n[0]).join(),
            style: theme.textTheme.headlineMedium?.copyWith(
              color: theme.colorScheme.primary,
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        AnimatedGradientText(
          text: profile.name,
          style: theme.textTheme.headlineMedium,
        ),
        const SizedBox(height: AppSpacing.xs),
        Text(
          profile.title,
          style: theme.textTheme.titleMedium?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: AppSpacing.xs),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.location_on_outlined,
              size: 16,
              color: theme.colorScheme.onSurfaceVariant,
            ),
            const SizedBox(width: AppSpacing.xxs),
            Text(
              profile.location,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.md),
        _SocialRow(links: profile.socialLinks),
      ],
    );
  }
}

class _HeroExpanded extends StatelessWidget {
  final Profile profile;
  const _HeroExpanded({required this.profile});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        CircleAvatar(
          radius: 64,
          backgroundColor: theme.colorScheme.primary.withValues(alpha: 0.1),
          child: Text(
            profile.name.split(' ').map((n) => n[0]).join(),
            style: theme.textTheme.displaySmall?.copyWith(
              color: theme.colorScheme.primary,
            ),
          ),
        ),
        const SizedBox(width: AppSpacing.xl),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnimatedGradientText(
                text: profile.name,
                style: theme.textTheme.displaySmall,
              ),
              const SizedBox(height: AppSpacing.xs),
              Text(
                profile.title,
                style: theme.textTheme.titleLarge?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: AppSpacing.sm),
              Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    size: 16,
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                  const SizedBox(width: AppSpacing.xxs),
                  Text(
                    profile.location,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.md),
              _SocialRow(links: profile.socialLinks),
            ],
          ),
        ),
      ],
    );
  }
}

// ─── Social Links ──────────────────────────────────────

class _SocialRow extends StatelessWidget {
  final SocialLinks links;
  const _SocialRow({required this.links});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (links.github != null)
          SocialIconButton(
            icon: Icons.code,
            label: 'GitHub',
            onPressed: () {},
          ),
        if (links.linkedin != null)
          SocialIconButton(
            icon: Icons.business,
            label: 'LinkedIn',
            onPressed: () {},
          ),
        if (links.twitter != null)
          SocialIconButton(
            icon: Icons.alternate_email,
            label: 'Twitter',
            onPressed: () {},
          ),
        if (links.telegram != null)
          SocialIconButton(
            icon: Icons.send,
            label: 'Telegram',
            onPressed: () {},
          ),
        if (links.email != null)
          SocialIconButton(
            icon: Icons.email_outlined,
            label: 'Email',
            onPressed: () {},
          ),
      ],
    );
  }
}

// ─── Skills ────────────────────────────────────────────

class _SkillsGrid extends StatelessWidget {
  final List<Skill> skills;
  const _SkillsGrid({required this.skills});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      compact: (_) => Column(
        children: skills
            .map((s) => Padding(
                  padding: const EdgeInsets.only(bottom: AppSpacing.md),
                  child: SkillBar(
                    name: s.name,
                    percentage: s.proficiency,
                  ),
                ))
            .toList(),
      ),
      expanded: (_) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              children: skills
                  .take((skills.length / 2).ceil())
                  .map((s) => Padding(
                        padding:
                            const EdgeInsets.only(bottom: AppSpacing.md),
                        child: SkillBar(
                          name: s.name,
                          percentage: s.proficiency,
                        ),
                      ))
                  .toList(),
            ),
          ),
          const SizedBox(width: AppSpacing.xl),
          Expanded(
            child: Column(
              children: skills
                  .skip((skills.length / 2).ceil())
                  .map((s) => Padding(
                        padding:
                            const EdgeInsets.only(bottom: AppSpacing.md),
                        child: SkillBar(
                          name: s.name,
                          percentage: s.proficiency,
                        ),
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Experience Timeline ───────────────────────────────

class _ExperienceCard extends StatelessWidget {
  final Experience experience;
  final bool isLast;

  const _ExperienceCard({
    required this.experience,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timeline indicator
          SizedBox(
            width: 24,
            child: Column(
              children: [
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: experience.isCurrent
                        ? theme.colorScheme.primary
                        : theme.colorScheme.outline,
                    border: experience.isCurrent
                        ? Border.all(
                            color: theme.colorScheme.primary
                                .withValues(alpha: 0.3),
                            width: 3,
                          )
                        : null,
                  ),
                ),
                if (!isLast)
                  Expanded(
                    child: Container(
                      width: 2,
                      color: theme.colorScheme.outline.withValues(alpha: 0.3),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: AppSpacing.md),

          // Content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.lg),
              child: AppCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title & company
                    Text(
                      experience.title,
                      style: theme.textTheme.titleMedium,
                    ),
                    const SizedBox(height: AppSpacing.xxs),
                    Text(
                      experience.company,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.primary,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.xs),

                    // Duration
                    Row(
                      children: [
                        Text(
                          experience.isCurrent ? 'Present' : '',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                        if (experience.isCurrent)
                          const SizedBox(width: AppSpacing.sm),
                        Text(
                          experience.durationDisplay,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),

                    // Description
                    if (experience.description != null) ...[
                      const SizedBox(height: AppSpacing.sm),
                      Text(
                        experience.description!,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                          height: 1.6,
                        ),
                      ),
                    ],

                    // Technologies
                    if (experience.technologies.isNotEmpty) ...[
                      const SizedBox(height: AppSpacing.sm),
                      Wrap(
                        spacing: AppSpacing.xs,
                        runSpacing: AppSpacing.xxs,
                        children: experience.technologies
                            .map((t) => TagChip(label: t))
                            .toList(),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
