import 'package:meta/meta.dart';

/// Represents a single analytics event.
@immutable
class AnalyticsEvent {
  /// Event name (e.g., 'blog_post_viewed', 'portfolio_opened').
  final String name;

  /// Optional parameters for the event.
  final Map<String, Object?>? parameters;

  const AnalyticsEvent({
    required this.name,
    this.parameters,
  });

  @override
  String toString() => 'AnalyticsEvent($name, $parameters)';
}
