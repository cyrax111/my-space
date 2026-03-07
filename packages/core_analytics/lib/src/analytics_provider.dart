import 'analytics_event.dart';

/// Abstract analytics provider.
///
/// Implement this to connect to Firebase Analytics, Mixpanel, etc.
abstract class AnalyticsProvider {
  /// Track a custom event.
  Future<void> trackEvent(AnalyticsEvent event);

  /// Track a screen view.
  Future<void> trackScreenView({
    required String screenName,
    String? screenClass,
  });

  /// Set a user property for segmentation.
  Future<void> setUserProperty({
    required String name,
    required String? value,
  });

  /// Set the user ID for cross-device tracking.
  Future<void> setUserId(String? userId);

  /// Initialize the provider (call once at app startup).
  Future<void> initialize();
}
