import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'app_logger.dart';

/// Logger implementation using the logger package
@LazySingleton(as: AppLogger)
class LoggerImpl implements AppLogger {
  final Logger _logger;

  LoggerImpl()
      : _logger = Logger(
          printer: PrettyPrinter(
            methodCount: 2,
            errorMethodCount: 8,
            lineLength: 120,
            colors: true,
            printEmojis: true,
            dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
          ),
        );

  @override
  void debug(String message, [Map<String, dynamic>? data]) {
    _logger.d(message, error: data);
  }

  @override
  void info(String message, [Map<String, dynamic>? data]) {
    _logger.i(message, error: data);
  }

  @override
  void warning(String message, [Map<String, dynamic>? data]) {
    _logger.w(message, error: data);
  }

  @override
  void error(
    String message, {
    Object? error,
    StackTrace? stackTrace,
    Map<String, dynamic>? data,
  }) {
    _logger.e(message, error: error, stackTrace: stackTrace);
  }
}
