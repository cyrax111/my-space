/// Core logging abstraction for the application.
///
/// Provides a pluggable logging interface with severity levels.
/// Implementations can forward to console, Crashlytics, Sentry, etc.
library core_logging;

export 'src/log_level.dart';
export 'src/log_record.dart';
export 'src/logger.dart';
export 'src/console_logger.dart';
export 'src/composite_logger.dart';
