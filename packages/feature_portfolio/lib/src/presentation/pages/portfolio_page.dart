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
      builder: (context, state) => switch (state.status) {
        PortfolioStatus.initial ||
        PortfolioStatus.loading when state.projects.isEmpty =>
          const LoadingIndicator(message: 'Loading projects...'),
        PortfolioStatus.error when state.projects.isEmpty => ErrorView(
            message: state.errorMessage ?? 'Something went wrong',
            onRetry: () => context
                .read<PortfolioBloc>()
                .add(const PortfolioEvent.loadRequested()),
          ),
        _ => _LoadedContent(
            projects: state.projects,
            activeFilter: state.activeFilter,
            errorMessage:
                state.status == PortfolioStatus.error
                    ? state.errorMessage
                    : null,
          ),
      },
    );
  }
}

class _LoadedContent extends StatelessWidget {
  final List<Project> projects;
  final ProjectType? activeFilter;
  final String? errorMessage;

  const _LoadedContent({
    required this.projects,
    this.activeFilter,
    this.errorMessage,
  });

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SectionHeader(
                  title: 'Portfolio',
                  subtitle: '${projects.length} projects',
                ),
                if (errorMessage != null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                    child: Text(
                      'Refresh failed: $errorMessage',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.error,
                      ),
                    ),
                  ),
              ],
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
          sliver: SliverResponsiveBuilder(
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
