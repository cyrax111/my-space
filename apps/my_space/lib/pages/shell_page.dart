import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../router/app_router.dart';

/// Shell page providing adaptive navigation for all routes.
///
/// Uses [AdaptiveScaffold] to switch between bottom nav (mobile),
/// navigation rail (tablet), and sidebar (desktop).
class ShellPage extends StatelessWidget {
  final Widget child;

  const ShellPage({super.key, required this.child});

  static const _destinations = <AppNavDestination>[
    AppNavDestination(
      icon: Icon(Icons.home_outlined),
      selectedIcon: Icon(Icons.home),
      label: 'Home',
    ),
    AppNavDestination(
      icon: Icon(Icons.article_outlined),
      selectedIcon: Icon(Icons.article),
      label: 'Blog',
    ),
    AppNavDestination(
      icon: Icon(Icons.work_outline),
      selectedIcon: Icon(Icons.work),
      label: 'Portfolio',
    ),
    AppNavDestination(
      icon: Icon(Icons.person_outline),
      selectedIcon: Icon(Icons.person),
      label: 'About',
    ),
    AppNavDestination(
      icon: Icon(Icons.mail_outline),
      selectedIcon: Icon(Icons.mail),
      label: 'Contact',
    ),
  ];

  static const _routes = [
    AppRoutes.home,
    AppRoutes.blog,
    AppRoutes.portfolio,
    AppRoutes.about,
    AppRoutes.contact,
  ];

  int _selectedIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.path;
    for (var i = _routes.length - 1; i >= 0; i--) {
      if (location.startsWith(_routes[i]) && _routes[i] != '/') {
        return i;
      }
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return AdaptiveScaffold(
      body: child,
      destinations: _destinations,
      selectedIndex: _selectedIndex(context),
      onDestinationSelected: (index) => context.go(_routes[index]),
      sidebarTitle: 'My Space',
    );
  }
}
