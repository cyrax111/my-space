import 'analytics_event.dart';
import 'analytics_provider.dart';

/// Fans out analytics events to multiple providers.
class CompositeAnalytics extends AnalyticsProvider {
  final List<AnalyticsProvider> _providers;

  CompositeAnalytics(this._providers);

  @override
  Future<void> initialize() async {
    for (final provider in _providers) {
      await provider.initialize();
    }
  }

  @override
  Future<void> trackEvent(AnalyticsEvent event) async {
    for (final provider in _providers) {
      await provider.trackEvent(event);
    }
  }

  @override
  Future<void> trackScreenView({
    required String screenName,
    String? screenClass,
  }) async {
    for (final provider in _providers) {
      await provider.trackScreenView(
        screenName: screenName,
        screenClass: screenClass,
      );
    }
  }

  @override
  Future<void> setUserProperty({
    required String name,
    required String? value,
  }) async {
    for (final provider in _providers) {
      await provider.setUserProperty(name: name, value: value);
    }
  }

  @override
  Future<void> setUserId(String? userId) async {
    for (final provider in _providers) {
      await provider.setUserId(userId);
    }
  }
}
