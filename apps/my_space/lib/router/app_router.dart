import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../features/home/home_page.dart';
import '../features/blog/blog_list_page.dart';
import '../features/portfolio/portfolio_list_page.dart';
import '../features/about/about_page.dart';
import '../features/contact/contact_page.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/home',
    routes: [
      GoRoute(
        path: '/home',
        name: 'home',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/blog',
        name: 'blog',
        builder: (context, state) => const BlogListPage(),
      ),
      GoRoute(
        path: '/portfolio',
        name: 'portfolio',
        builder: (context, state) => const PortfolioListPage(),
      ),
      GoRoute(
        path: '/about',
        name: 'about',
        builder: (context, state) => const AboutPage(),
      ),
      GoRoute(
        path: '/contact',
        name: 'contact',
        builder: (context, state) => const ContactPage(),
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text('Page not found: ${state.uri}'),
      ),
    ),
  );
}
