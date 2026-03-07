import 'package:flutter/foundation.dart';

/// Platform detection and behavior abstraction.
///
/// Use this instead of `Platform.isXxx` to handle web correctly
/// and provide a testable abstraction.
abstract final class PlatformInfo {
  /// Whether running on the web.
  static bool get isWeb => kIsWeb;

  /// Whether running on iOS (including iPadOS).
  static bool get isIOS =>
      !kIsWeb && defaultTargetPlatform == TargetPlatform.iOS;

  /// Whether running on Android.
  static bool get isAndroid =>
      !kIsWeb && defaultTargetPlatform == TargetPlatform.android;

  /// Whether running on macOS.
  static bool get isMacOS =>
      !kIsWeb && defaultTargetPlatform == TargetPlatform.macOS;

  /// Whether running on Windows.
  static bool get isWindows =>
      !kIsWeb && defaultTargetPlatform == TargetPlatform.windows;

  /// Whether running on Linux.
  static bool get isLinux =>
      !kIsWeb && defaultTargetPlatform == TargetPlatform.linux;

  /// Whether running on a desktop platform (macOS, Windows, Linux).
  static bool get isDesktop => isMacOS || isWindows || isLinux;

  /// Whether running on a mobile platform (iOS, Android).
  static bool get isMobile => isIOS || isAndroid;

  /// Whether the platform supports hover interactions.
  static bool get supportsHover => isDesktop || isWeb;

  /// Whether the platform has a physical keyboard.
  static bool get hasPhysicalKeyboard => isDesktop;

  /// Whether the platform supports context menus (right-click).
  static bool get supportsContextMenu => isDesktop || isWeb;

  /// Whether window management APIs are available.
  static bool get supportsWindowing => isDesktop;
}
