import 'package:core_analytics/core_analytics.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AnalyticsEvent', () {
    test('stores name and parameters', () {
      const event = AnalyticsEvent(
        name: 'page_view',
        parameters: {'page': 'home'},
      );
      expect(event.name, 'page_view');
      expect(event.parameters, {'page': 'home'});
    });

    test('toString is readable', () {
      const event = AnalyticsEvent(name: 'test');
      expect(event.toString(), contains('test'));
    });
  });

  group('NoopAnalytics', () {
    late NoopAnalytics analytics;

    setUp(() {
      analytics = NoopAnalytics();
    });

    test('tracks events', () async {
      const event = AnalyticsEvent(name: 'click');
      await analytics.trackEvent(event);

      expect(analytics.trackedEvents, hasLength(1));
      expect(analytics.trackedEvents.first.name, 'click');
    });

    test('tracks screen views', () async {
      await analytics.trackScreenView(screenName: 'home');

      expect(analytics.trackedScreens, hasLength(1));
      expect(analytics.trackedScreens.first, 'home');
    });

    test('initialize does not throw', () async {
      await expectLater(analytics.initialize(), completes);
    });

    test('setUserProperty does not throw', () async {
      await expectLater(
        analytics.setUserProperty(name: 'plan', value: 'pro'),
        completes,
      );
    });

    test('setUserId does not throw', () async {
      await expectLater(analytics.setUserId('user123'), completes);
    });
  });

  group('CompositeAnalytics', () {
    test('fans out trackEvent to all providers', () async {
      final a = NoopAnalytics();
      final b = NoopAnalytics();
      final composite = CompositeAnalytics([a, b]);

      const event = AnalyticsEvent(name: 'tap');
      await composite.trackEvent(event);

      expect(a.trackedEvents, hasLength(1));
      expect(b.trackedEvents, hasLength(1));
    });

    test('fans out trackScreenView', () async {
      final a = NoopAnalytics();
      final b = NoopAnalytics();
      final composite = CompositeAnalytics([a, b]);

      await composite.trackScreenView(screenName: 'blog');

      expect(a.trackedScreens, ['blog']);
      expect(b.trackedScreens, ['blog']);
    });

    test('fans out initialize', () async {
      final a = NoopAnalytics();
      final composite = CompositeAnalytics([a]);

      await expectLater(composite.initialize(), completes);
    });
  });
}
