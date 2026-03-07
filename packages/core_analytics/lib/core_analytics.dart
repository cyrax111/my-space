/// Analytics abstraction for the application.
///
/// Provides a pluggable interface for tracking events, screen views,
/// and user properties. Implementations can forward to Firebase Analytics,
/// Mixpanel, Amplitude, or any other provider.
library core_analytics;

export 'src/analytics_event.dart';
export 'src/analytics_provider.dart';
export 'src/composite_analytics.dart';
export 'src/noop_analytics.dart';
