import 'package:about/about.dart';
import 'package:blog/blog.dart';
import 'package:contact/contact.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/portfolio.dart';

import 'shell_page.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

GoRouter createRouter() {
  return GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: '/about',
    routes: <RouteBase>[
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            ShellPage(shell: navigationShell),
        branches: <StatefulShellBranch>[
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: '/blog',
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: BlogPage()),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: '/portfolio',
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: PortfolioPage()),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: '/about',
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: AboutPage()),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: '/contact',
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: ContactPage()),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
