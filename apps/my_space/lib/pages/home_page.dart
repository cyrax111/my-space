import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../router/app_router.dart';

/// Home page — hero section with navigation cards to features.
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return CustomScrollView(
      slivers: [
        // Hero section
        SliverAdaptivePadding(
          sliver: SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: AppSpacing.xxl),
              child: ResponsiveBuilder(
                compact: (_) => _HeroCompact(theme: theme),
                expanded: (_) => _HeroExpanded(theme: theme),
              ),
            ),
          ),
        ),

        // Feature cards
        SliverAdaptivePadding(
          sliver: SliverToBoxAdapter(
            child: SectionHeader(
              title: 'Explore',
              subtitle: 'Browse around',
            ),
          ),
        ),

        SliverAdaptivePadding(
          sliver: SliverResponsiveBuilder(
            compact: (_) => SliverList.separated(
              itemCount: _featureCards.length,
              separatorBuilder: (_, __) =>
                  const SizedBox(height: AppSpacing.md),
              itemBuilder: (context, index) =>
                  _FeatureCard(data: _featureCards[index]),
            ),
            expanded: (_) => SliverGrid.count(
              crossAxisCount: 2,
              mainAxisSpacing: AppSpacing.md,
              crossAxisSpacing: AppSpacing.md,
              childAspectRatio: 2.5,
              children: _featureCards
                  .map((d) => _FeatureCard(data: d))
                  .toList(),
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
  final ThemeData theme;
  const _HeroCompact({required this.theme});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('👋', style: TextStyle(fontSize: 48)),
        const SizedBox(height: AppSpacing.md),
        AnimatedGradientText(
          text: 'Alexander Bosak',
          style: theme.textTheme.displaySmall,
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(
          'Flutter & Mobile Developer',
          style: theme.textTheme.titleLarge?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        Text(
          'Building beautiful, performant cross-platform apps. '
          'Clean architecture enthusiast. Based in Dubai.',
          style: theme.textTheme.bodyLarge?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
            height: 1.6,
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        Row(
          children: [
            FilledButton.icon(
              onPressed: () => context.go(AppRoutes.portfolio),
              icon: const Icon(Icons.work_outline),
              label: const Text('View Work'),
            ),
            const SizedBox(width: AppSpacing.md),
            OutlinedButton.icon(
              onPressed: () => context.go(AppRoutes.contact),
              icon: const Icon(Icons.mail_outline),
              label: const Text('Contact'),
            ),
          ],
        ),
      ],
    );
  }
}

class _HeroExpanded extends StatelessWidget {
  final ThemeData theme;
  const _HeroExpanded({required this.theme});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('👋', style: TextStyle(fontSize: 56)),
              const SizedBox(height: AppSpacing.md),
              AnimatedGradientText(
                text: 'Alexander Bosak',
                style: theme.textTheme.displayMedium,
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                'Flutter & Mobile Developer',
                style: theme.textTheme.headlineSmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 520),
                child: Text(
                  'Building beautiful, performant cross-platform apps. '
                  'Clean architecture enthusiast. Based in Dubai. '
                  'I write code that scales and UIs that delight.',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                    height: 1.6,
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.xl),
              Row(
                children: [
                  FilledButton.icon(
                    onPressed: () => context.go(AppRoutes.portfolio),
                    icon: const Icon(Icons.work_outline),
                    label: const Text('View My Work'),
                  ),
                  const SizedBox(width: AppSpacing.md),
                  OutlinedButton.icon(
                    onPressed: () => context.go(AppRoutes.contact),
                    icon: const Icon(Icons.mail_outline),
                    label: const Text('Get In Touch'),
                  ),
                ],
              ),
            ],
          ),
        ),
        // Decorative element (can be replaced with an image later)
        SizedBox(
          width: 300,
          height: 300,
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: AppColors.heroGradient,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Center(
              child: Text(
                '< / >',
                style: theme.textTheme.displayLarge?.copyWith(
                  color: Colors.white.withValues(alpha: 0.9),
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// ─── Feature Cards ─────────────────────────────────────

class _FeatureCardData {
  final String title;
  final String subtitle;
  final IconData icon;
  final String route;

  const _FeatureCardData({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.route,
  });
}

const _featureCards = [
  _FeatureCardData(
    title: 'Blog',
    subtitle: 'Thoughts on Flutter, architecture, and development',
    icon: Icons.article_outlined,
    route: AppRoutes.blog,
  ),
  _FeatureCardData(
    title: 'Portfolio',
    subtitle: 'Projects and work I\'m proud of',
    icon: Icons.work_outline,
    route: AppRoutes.portfolio,
  ),
  _FeatureCardData(
    title: 'About',
    subtitle: 'Skills, experience, and who I am',
    icon: Icons.person_outline,
    route: AppRoutes.about,
  ),
  _FeatureCardData(
    title: 'Contact',
    subtitle: 'Get in touch — let\'s build something',
    icon: Icons.mail_outline,
    route: AppRoutes.contact,
  ),
];

class _FeatureCard extends StatelessWidget {
  final _FeatureCardData data;

  const _FeatureCard({required this.data});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppCard(
      onTap: () => context.go(data.route),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: theme.colorScheme.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              data.icon,
              color: theme.colorScheme.primary,
            ),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  data.title,
                  style: theme.textTheme.titleMedium,
                ),
                const SizedBox(height: AppSpacing.xxs),
                Text(
                  data.subtitle,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ],
      ),
    );
  }
}
