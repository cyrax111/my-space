import 'analytics_event.dart';
import 'analytics_provider.dart';

/// No-op analytics for testing and development.
class NoopAnalytics extends AnalyticsProvider {
  final List<AnalyticsEvent> trackedEvents = [];
  final List<String> trackedScreens = [];

  @override
  Future<void> initialize() async {}

  @override
  Future<void> trackEvent(AnalyticsEvent event) async {
    trackedEvents.add(event);
  }

  @override
  Future<void> trackScreenView({
    required String screenName,
    String? screenClass,
  }) async {
    trackedScreens.add(screenName);
  }

  @override
  Future<void> setUserProperty({
    required String name,
    required String? value,
  }) async {}

  @override
  Future<void> setUserId(String? userId) async {}
}
