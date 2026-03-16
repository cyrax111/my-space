import 'package:feature_about/feature_about.dart';
import 'package:feature_blog/feature_blog.dart';
import 'package:feature_contact/feature_contact.dart';
import 'package:feature_portfolio/feature_portfolio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../pages/shell_page.dart';
import '../pages/home_page.dart';

/// Application route paths.
abstract final class AppRoutes {
  static const String home = '/';
  static const String blog = '/blog';
  static const String blogPost = '/blog/:slug';
  static const String portfolio = '/portfolio';
  static const String about = '/about';
  static const String contact = '/contact';
}

/// Application router configuration.
final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.home,
  debugLogDiagnostics: false,
  routes: [
    ShellRoute(
      builder: (context, state, child) => ShellPage(child: child),
      routes: [
        GoRoute(
          path: AppRoutes.home,
          name: 'home',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: HomePage(),
          ),
        ),
        GoRoute(
          path: AppRoutes.blog,
          name: 'blog',
          pageBuilder: (context, state) => NoTransitionPage(
            child: BlogMasterDetailPage(
              onPostTap: (slug) => context.go('${AppRoutes.blog}/$slug'),
            ),
          ),
        ),
        GoRoute(
          path: AppRoutes.blogPost,
          name: 'blog-post',
          pageBuilder: (context, state) {
            final slug = state.pathParameters['slug'] ?? '';
            return NoTransitionPage(
              child: BlogDetailPage(slug: slug),
            );
          },
        ),
        GoRoute(
          path: AppRoutes.portfolio,
          name: 'portfolio',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: PortfolioPage(),
          ),
        ),
        GoRoute(
          path: AppRoutes.about,
          name: 'about',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: AboutPage(),
          ),
        ),
        GoRoute(
          path: AppRoutes.contact,
          name: 'contact',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: ContactPage(),
          ),
        ),
      ],
    ),
  ],
);
