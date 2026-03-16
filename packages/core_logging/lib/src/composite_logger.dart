import 'log_record.dart';
import 'logger.dart';

/// Fans out log records to multiple [AppLogger] backends.
///
/// ```dart
/// final logger = CompositeLogger([
///   ConsoleLogger(),
///   CrashlyticsLogger(),
///   SentryLogger(),
/// ]);
/// ```
class CompositeLogger extends AppLogger {
  final List<AppLogger> _loggers;

  CompositeLogger(this._loggers);

  @override
  void log(LogRecord record) {
    for (final logger in _loggers) {
      logger.log(record);
    }
  }
}
