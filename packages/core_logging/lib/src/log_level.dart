/// Severity levels for log messages, ordered by increasing severity.
enum LogLevel {
  /// Verbose diagnostic information.
  debug,

  /// General informational messages.
  info,

  /// Potentially harmful situations.
  warning,

  /// Error events that might still allow the app to continue.
  error,

  /// Severe error events leading to premature termination.
  fatal,
}
