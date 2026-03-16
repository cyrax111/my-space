import 'package:flutter/material.dart';

import 'app/app.dart';
import 'di/service_locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize dependency injection
  setupServiceLocator();

  runApp(const MySpaceApp());
}
