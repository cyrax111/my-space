import 'log_level.dart';
import 'log_record.dart';

/// Abstract logging interface.
///
/// Implementations decide where logs go (console, file, crash reporting, etc.).
/// Use [CompositeLogger] to fan out to multiple backends.
abstract class AppLogger {
  /// Log a record.
  void log(LogRecord record);

  /// Convenience methods.
  void debug(String message, {String? tag, Map<String, Object?>? extra}) =>
      log(LogRecord(level: LogLevel.debug, message: message, tag: tag, extra: extra));

  void info(String message, {String? tag, Map<String, Object?>? extra}) =>
      log(LogRecord(level: LogLevel.info, message: message, tag: tag, extra: extra));

  void warning(
    String message, {
    String? tag,
    Object? error,
    StackTrace? stackTrace,
    Map<String, Object?>? extra,
  }) =>
      log(LogRecord(
        level: LogLevel.warning,
        message: message,
        tag: tag,
        error: error,
        stackTrace: stackTrace,
        extra: extra,
      ));

  void error(
    String message, {
    String? tag,
    Object? error,
    StackTrace? stackTrace,
    Map<String, Object?>? extra,
  }) =>
      log(LogRecord(
        level: LogLevel.error,
        message: message,
        tag: tag,
        error: error,
        stackTrace: stackTrace,
        extra: extra,
      ));

  void fatal(
    String message, {
    String? tag,
    Object? error,
    StackTrace? stackTrace,
    Map<String, Object?>? extra,
  }) =>
      log(LogRecord(
        level: LogLevel.fatal,
        message: message,
        tag: tag,
        error: error,
        stackTrace: stackTrace,
        extra: extra,
      ));
}
