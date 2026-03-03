import 'package:flutter/material.dart';
import 'package:core_ui/core_ui.dart';
import 'core/di/injection.dart';
import 'router/app_router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize dependency injection
  configureDependencies();
  
  runApp(const MySpaceApp());
}

class MySpaceApp extends StatelessWidget {
  const MySpaceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'My Space',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      routerConfig: AppRouter.router,
    );
  }
}
