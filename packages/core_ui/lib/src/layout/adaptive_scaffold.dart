import 'package:flutter/material.dart';
import 'breakpoints.dart';

/// Adaptive scaffold that changes navigation pattern based on screen size
/// - Compact: Bottom navigation bar
/// - Medium: Navigation rail
/// - Expanded: Side panel with master-detail layout
class AdaptiveScaffold extends StatelessWidget {
  final Widget body;
  final List<NavigationDestination> destinations;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;
  final Widget? floatingActionButton;
  final PreferredSizeWidget? appBar;

  const AdaptiveScaffold({
    super.key,
    required this.body,
    required this.destinations,
    required this.selectedIndex,
    required this.onDestinationSelected,
    this.floatingActionButton,
    this.appBar,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final layoutSize = LayoutSize.fromWidth(constraints.maxWidth);

        switch (layoutSize) {
          case LayoutSize.compact:
            return _buildCompactLayout(context);
          case LayoutSize.medium:
            return _buildMediumLayout(context);
          case LayoutSize.expanded:
            return _buildExpandedLayout(context);
        }
      },
    );
  }

  Widget _buildCompactLayout(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: body,
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: onDestinationSelected,
        destinations: destinations,
      ),
    );
  }

  Widget _buildMediumLayout(BuildContext context) {
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
                  (dest) => NavigationRailDestination(
                    icon: dest.icon,
                    selectedIcon: dest.selectedIcon ?? dest.icon,
                    label: Text(dest.label),
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

  Widget _buildExpandedLayout(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Side panel with navigation
          SizedBox(
            width: 280,
            child: Column(
              children: [
                if (appBar != null)
                  SizedBox(
                    height: kToolbarHeight,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'My Space',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                    ),
                  ),
                Expanded(
                  child: ListView.builder(
                    itemCount: destinations.length,
                    padding: const EdgeInsets.all(8),
                    itemBuilder: (context, index) {
                      final dest = destinations[index];
                      final isSelected = index == selectedIndex;
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: ListTile(
                          leading: isSelected ? dest.selectedIcon ?? dest.icon : dest.icon,
                          title: Text(dest.label),
                          selected: isSelected,
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
          // Main content area
          Expanded(child: body),
        ],
      ),
      floatingActionButton: floatingActionButton,
    );
  }
}
