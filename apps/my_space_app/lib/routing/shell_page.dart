import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ShellPage extends StatelessWidget {
  const ShellPage({required this.shell, super.key});

  final StatefulNavigationShell shell;

  @override
  Widget build(BuildContext context) {
    const destinations = <NavigationDestination>[
      NavigationDestination(icon: Icon(Icons.article_outlined), label: 'Blog'),
      NavigationDestination(icon: Icon(Icons.work_outline), label: 'Portfolio'),
      NavigationDestination(icon: Icon(Icons.person_outline), label: 'About'),
      NavigationDestination(icon: Icon(Icons.contact_mail_outlined), label: 'Contact'),
    ];

    return AdaptiveScaffold(
      destinations: destinations,
      index: shell.currentIndex,
      onDestinationSelected: shell.goBranch,
      body: shell,
    );
  }
}
