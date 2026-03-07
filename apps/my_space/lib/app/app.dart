import 'package:core_ui/core_ui.dart';
import 'package:feature_about/feature_about.dart';
import 'package:feature_blog/feature_blog.dart';
import 'package:feature_contact/feature_contact.dart';
import 'package:feature_portfolio/feature_portfolio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../di/service_locator.dart';
import '../router/app_router.dart';

/// Root application widget.
///
/// Sets up theming, routing, and provides BLoC instances.
class MySpaceApp extends StatelessWidget {
  const MySpaceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => sl<BlogBloc>()
            ..add(const BlogEvent.loadRequested()),
        ),
        BlocProvider(
          create: (_) => sl<PortfolioBloc>()
            ..add(const PortfolioEvent.loadRequested()),
        ),
        BlocProvider(
          create: (_) => sl<AboutBloc>()
            ..add(const AboutEvent.loadRequested()),
        ),
        BlocProvider(
          create: (_) => sl<ContactBloc>(),
        ),
      ],
      child: MaterialApp.router(
        title: 'My Space — Alexander Bosak',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        routerConfig: appRouter,
      ),
    );
  }
}
