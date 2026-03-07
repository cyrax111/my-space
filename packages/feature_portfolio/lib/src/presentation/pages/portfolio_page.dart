import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/project.dart';
import '../bloc/portfolio_bloc.dart';
import '../bloc/portfolio_event.dart';
import '../bloc/portfolio_state.dart';
import '../widgets/project_card.dart';

/// Portfolio page — shows projects in a responsive grid.
class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PortfolioBloc, PortfolioState>(
      builder: (context, state) => switch (state) {
        PortfolioInitial() =>
          const LoadingIndicator(message: 'Loading projects...'),
        PortfolioLoading() =>
          const LoadingIndicator(message: 'Loading projects...'),
        PortfolioError(:final message) => ErrorView(
            message: message,
            onRetry: () => context
                .read<PortfolioBloc>()
                .add(const PortfolioEvent.loadRequested()),
          ),
        PortfolioLoaded(:final projects, :final activeFilter) =>
          _LoadedContent(projects: projects, activeFilter: activeFilter),
      },
    );
  }
}

class _LoadedContent extends StatelessWidget {
  final List<Project> projects;
  final ProjectType? activeFilter;

  const _LoadedContent({required this.projects, this.activeFilter});

  @override
  Widget build(BuildContext context) {
    if (projects.isEmpty) {
      return const EmptyState(
        icon: Icons.work_outline,
        message: 'No projects yet. Stay tuned!',
      );
    }

    return CustomScrollView(
      slivers: [
        SliverAdaptivePadding(
          sliver: SliverToBoxAdapter(
            child: SectionHeader(
              title: 'Portfolio',
              subtitle: '${projects.length} projects',
            ),
          ),
        ),

        // Filter chips
        SliverAdaptivePadding(
          sliver: SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.lg),
              child: Wrap(
                spacing: AppSpacing.sm,
                children: [
                  TagChip(
                    label: 'All',
                    isSelected: activeFilter == null,
                    onTap: () => context
                        .read<PortfolioBloc>()
                        .add(const PortfolioEvent.loadRequested()),
                  ),
                  ...ProjectType.values.map(
                    (type) => TagChip(
                      label: type.displayName,
                      isSelected: activeFilter == type,
                      onTap: () => context
                          .read<PortfolioBloc>()
                          .add(PortfolioEvent.loadRequested(type: type)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        // Project grid
        SliverAdaptivePadding(
          sliver: ResponsiveBuilder(
            compact: (_) => SliverList.separated(
              itemCount: projects.length,
              separatorBuilder: (_, __) =>
                  const SizedBox(height: AppSpacing.md),
              itemBuilder: (_, index) =>
                  ProjectCard(project: projects[index]),
            ),
            medium: (_) => SliverGrid.count(
              crossAxisCount: 2,
              mainAxisSpacing: AppSpacing.md,
              crossAxisSpacing: AppSpacing.md,
              childAspectRatio: 1.3,
              children: projects
                  .map((p) => ProjectCard(project: p))
                  .toList(),
            ),
            expanded: (_) => SliverGrid.count(
              crossAxisCount: 3,
              mainAxisSpacing: AppSpacing.md,
              crossAxisSpacing: AppSpacing.md,
              childAspectRatio: 1.2,
              children: projects
                  .map((p) => ProjectCard(project: p))
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

/// Extension for display names.
extension ProjectTypeX on ProjectType {
  String get displayName => switch (this) {
        ProjectType.app => 'Apps',
        ProjectType.web => 'Web',
        ProjectType.package => 'Packages',
        ProjectType.openSource => 'Open Source',
      };
}
