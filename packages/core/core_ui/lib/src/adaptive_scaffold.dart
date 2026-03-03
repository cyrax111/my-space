import 'package:flutter/material.dart';

import 'adaptive_layout.dart';

class AdaptiveScaffold extends StatelessWidget {
  const AdaptiveScaffold({
    required this.destinations,
    required this.index,
    required this.onDestinationSelected,
    required this.body,
    super.key,
  });

  final List<NavigationDestination> destinations;
  final int index;
  final ValueChanged<int> onDestinationSelected;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final sizeClass = classifyWidth(constraints.maxWidth);

        switch (sizeClass) {
          case AdaptiveSizeClass.compact:
            return Scaffold(
              body: body,
              bottomNavigationBar: NavigationBar(
                selectedIndex: index,
                onDestinationSelected: onDestinationSelected,
                destinations: destinations,
              ),
            );
          case AdaptiveSizeClass.medium:
            return Scaffold(
              body: Row(
                children: [
                  NavigationRail(
                    selectedIndex: index,
                    onDestinationSelected: onDestinationSelected,
                    destinations: destinations
                        .map((d) => NavigationRailDestination(
                              icon: d.icon,
                              selectedIcon: d.selectedIcon ?? d.icon,
                              label: Text(d.label),
                            ))
                        .toList(),
                  ),
                  Expanded(child: body),
                ],
              ),
            );
          case AdaptiveSizeClass.expanded:
            return Scaffold(
              body: Row(
                children: [
                  SizedBox(
                    width: 280,
                    child: NavigationDrawer(
                      selectedIndex: index,
                      onDestinationSelected: onDestinationSelected,
                      children: destinations
                          .map((d) => NavigationDrawerDestination(
                                icon: d.icon,
                                selectedIcon: d.selectedIcon ?? d.icon,
                                label: Text(d.label),
                              ))
                          .toList(),
                    ),
                  ),
                  const VerticalDivider(width: 1),
                  Expanded(child: body),
                ],
              ),
            );
        }
      },
    );
  }
}
