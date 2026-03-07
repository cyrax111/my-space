import 'dart:developer' as developer;

import 'log_level.dart';
import 'log_record.dart';
import 'logger.dart';

/// Logger that outputs to the developer console.
///
/// Uses [developer.log] for debug builds (appears in DevTools).
/// Filters messages below [minLevel].
class ConsoleLogger extends AppLogger {
  /// Minimum level to log. Messages below this are ignored.
  final LogLevel minLevel;

  ConsoleLogger({this.minLevel = LogLevel.debug});

  @override
  void log(LogRecord record) {
    if (record.level.index < minLevel.index) return;

    developer.log(
      record.message,
      name: record.tag ?? 'MySpace',
      level: _toDeveloperLevel(record.level),
      error: record.error,
      stackTrace: record.stackTrace,
      time: record.timestamp,
    );
  }

  int _toDeveloperLevel(LogLevel level) => switch (level) {
        LogLevel.debug => 500,
        LogLevel.info => 800,
        LogLevel.warning => 900,
        LogLevel.error => 1000,
        LogLevel.fatal => 1200,
      };
}
