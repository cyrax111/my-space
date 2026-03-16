import 'package:meta/meta.dart';

import 'log_level.dart';

/// Immutable record of a log event.
@immutable
class LogRecord {
  /// Severity of the log event.
  final LogLevel level;

  /// Human-readable message.
  final String message;

  /// Optional error object.
  final Object? error;

  /// Optional stack trace.
  final StackTrace? stackTrace;

  /// Optional tag for categorization (e.g., 'BlogBloc', 'NetworkClient').
  final String? tag;

  /// Timestamp of the log event.
  final DateTime timestamp;

  /// Optional extra data for structured logging.
  final Map<String, Object?>? extra;

  LogRecord({
    required this.level,
    required this.message,
    this.error,
    this.stackTrace,
    this.tag,
    this.extra,
    DateTime? timestamp,
  }) : timestamp = timestamp ?? DateTime.now();

  @override
  String toString() {
    final buffer = StringBuffer()
      ..write('[${level.name.toUpperCase()}]')
      ..write(tag != null ? ' [$tag]' : '')
      ..write(' $message');
    if (error != null) {
      buffer.write(' | Error: $error');
    }
    return buffer.toString();
  }
}
