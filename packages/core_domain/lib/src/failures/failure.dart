/// Unified exception hierarchy for the entire application.
///
/// Every expected error in the domain layer is represented as an
/// [AppException] subclass, enabling type-safe error handling with
/// Dart 3 sealed classes and pattern matching.
///
/// Usage:
/// ```dart
/// Future<User> getUser(String id) async {
///   try {
///     return await dataSource.fetchUser(id);
///   } on SocketException {
///     throw const NetworkException('No connection');
///   }
/// }
/// ```
sealed class AppException implements Exception {
  /// Human-readable message suitable for UI display.
  final String message;

  /// The original error that caused this exception, if any.
  final Object? cause;

  const AppException(this.message, {this.cause});

  /// Whether this exception represents a retryable failure.
  bool get isRetryable => switch (this) {
        NetworkException() => true,
        RateLimitedException() => true,
        StorageException() => true,
        _ => false,
      };

  @override
  String toString() => '$runtimeType: $message';
}

/// Network-related failures (timeout, no connection, server error).
class NetworkException extends AppException {
  final int? statusCode;

  const NetworkException(super.message, {this.statusCode, super.cause});
}

/// Authentication / authorization failures.
class AuthException extends AppException {
  const AuthException(super.message, {super.cause});
}

/// Input validation failures with per-field error messages.
class ValidationException extends AppException {
  final Map<String, String> fieldErrors;

  const ValidationException(
    super.message, {
    this.fieldErrors = const {},
    super.cause,
  });
}

/// Local storage read/write failures.
class StorageException extends AppException {
  const StorageException(super.message, {super.cause});
}

/// Requested resource not found.
class NotFoundException extends AppException {
  final String? entity;
  final String? id;

  const NotFoundException(super.message, {this.entity, this.id, super.cause});
}

/// Rate limiting / quota exceeded.
class RateLimitedException extends AppException {
  final Duration? retryAfter;

  const RateLimitedException(super.message, {this.retryAfter, super.cause});
}

/// Permission denied (user is authenticated but lacks access).
class PermissionDeniedException extends AppException {
  const PermissionDeniedException(super.message, {super.cause});
}

/// Catch-all for unexpected errors.
class UnknownException extends AppException {
  final StackTrace? stackTrace;

  const UnknownException(super.message, {super.cause, this.stackTrace});
}
