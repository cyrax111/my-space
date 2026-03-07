import 'package:flutter/material.dart';

import 'breakpoints.dart';
import '../theme/app_spacing.dart';

/// Navigation destination with icon and label.
class AppNavDestination {
  final Widget icon;
  final Widget selectedIcon;
  final String label;

  const AppNavDestination({
    required this.icon,
    required this.selectedIcon,
    required this.label,
  });
}

/// Adaptive scaffold that changes navigation based on screen size.
///
/// - Compact: bottom navigation bar
/// - Medium: navigation rail
/// - Expanded: persistent sidebar + content area
///
/// Handles navigation state internally. Use [onDestinationSelected]
/// to update the router.
class AdaptiveScaffold extends StatelessWidget {
  /// Main content area.
  final Widget body;

  /// Optional detail pane for master-detail on expanded layouts.
  final Widget? detailPane;

  /// Navigation destinations.
  final List<AppNavDestination> destinations;

  /// Currently selected destination index.
  final int selectedIndex;

  /// Called when a destination is tapped.
  final ValueChanged<int> onDestinationSelected;

  /// Optional app bar (shown on compact/medium only).
  final PreferredSizeWidget? appBar;

  /// Optional FAB.
  final Widget? floatingActionButton;

  /// Title shown in the sidebar on expanded layout.
  final String? sidebarTitle;

  const AdaptiveScaffold({
    super.key,
    required this.body,
    required this.destinations,
    required this.selectedIndex,
    required this.onDestinationSelected,
    this.detailPane,
    this.appBar,
    this.floatingActionButton,
    this.sidebarTitle,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final layoutSize = LayoutSize.fromWidth(constraints.maxWidth);
        return switch (layoutSize) {
          LayoutSize.compact => _CompactLayout(
              body: body,
              destinations: destinations,
              selectedIndex: selectedIndex,
              onDestinationSelected: onDestinationSelected,
              appBar: appBar,
              floatingActionButton: floatingActionButton,
            ),
          LayoutSize.medium => _MediumLayout(
              body: body,
              destinations: destinations,
              selectedIndex: selectedIndex,
              onDestinationSelected: onDestinationSelected,
              appBar: appBar,
              floatingActionButton: floatingActionButton,
            ),
          LayoutSize.expanded => _ExpandedLayout(
              body: body,
              detailPane: detailPane,
              destinations: destinations,
              selectedIndex: selectedIndex,
              onDestinationSelected: onDestinationSelected,
              sidebarTitle: sidebarTitle,
              floatingActionButton: floatingActionButton,
            ),
        };
      },
    );
  }
}

class _CompactLayout extends StatelessWidget {
  final Widget body;
  final List<AppNavDestination> destinations;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;
  final PreferredSizeWidget? appBar;
  final Widget? floatingActionButton;

  const _CompactLayout({
    required this.body,
    required this.destinations,
    required this.selectedIndex,
    required this.onDestinationSelected,
    this.appBar,
    this.floatingActionButton,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: body,
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: onDestinationSelected,
        destinations: destinations
            .map(
              (d) => NavigationDestination(
                icon: d.icon,
                selectedIcon: d.selectedIcon,
                label: d.label,
              ),
            )
            .toList(),
      ),
    );
  }
}

class _MediumLayout extends StatelessWidget {
  final Widget body;
  final List<AppNavDestination> destinations;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;
  final PreferredSizeWidget? appBar;
  final Widget? floatingActionButton;

  const _MediumLayout({
    required this.body,
    required this.destinations,
    required this.selectedIndex,
    required this.onDestinationSelected,
    this.appBar,
    this.floatingActionButton,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: selectedIndex,
            onDestinationSelected: onDestinationSelected,
            labelType: NavigationRailLabelType.all,
            destinations: destinations
                .map(
                  (d) => NavigationRailDestination(
                    icon: d.icon,
                    selectedIcon: d.selectedIcon,
                    label: Text(d.label),
                  ),
                )
                .toList(),
          ),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(child: body),
        ],
      ),
      floatingActionButton: floatingActionButton,
    );
  }
}

class _ExpandedLayout extends StatelessWidget {
  final Widget body;
  final Widget? detailPane;
  final List<AppNavDestination> destinations;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;
  final String? sidebarTitle;
  final Widget? floatingActionButton;

  const _ExpandedLayout({
    required this.body,
    required this.destinations,
    required this.selectedIndex,
    required this.onDestinationSelected,
    this.detailPane,
    this.sidebarTitle,
    this.floatingActionButton,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      body: Row(
        children: [
          // Sidebar
          Container(
            width: 280,
            color: colorScheme.surface,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Padding(
                  padding: const EdgeInsets.all(AppSpacing.lg),
                  child: Text(
                    sidebarTitle ?? 'My Space',
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const Divider(height: 1),
                // Nav items
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.sm,
                      vertical: AppSpacing.sm,
                    ),
                    itemCount: destinations.length,
                    itemBuilder: (context, index) {
                      final dest = destinations[index];
                      final isSelected = index == selectedIndex;
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: AppSpacing.xxs,
                        ),
                        child: ListTile(
                          leading: isSelected ? dest.selectedIcon : dest.icon,
                          title: Text(
                            dest.label,
                            style: theme.textTheme.bodyLarge?.copyWith(
                              fontWeight: isSelected
                                  ? FontWeight.w600
                                  : FontWeight.w400,
                            ),
                          ),
                          selected: isSelected,
                          selectedTileColor:
                              colorScheme.primary.withValues(alpha: 0.08),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          onTap: () => onDestinationSelected(index),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          const VerticalDivider(thickness: 1, width: 1),
          // Content area
          Expanded(
            flex: 3,
            child: body,
          ),
          // Detail pane (master-detail)
          if (detailPane != null) ...[
            const VerticalDivider(thickness: 1, width: 1),
            Expanded(
              flex: 2,
              child: detailPane!,
            ),
          ],
        ],
      ),
      floatingActionButton: floatingActionButton,
    );
  }
}
