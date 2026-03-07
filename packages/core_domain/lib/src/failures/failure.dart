import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

/// Unified failure hierarchy for the entire application.
///
/// Every error in the domain layer is represented as a [Failure],
/// enabling type-safe error handling with [Either<Failure, T>].
///
/// Usage with fpdart:
/// ```dart
/// Future<Either<Failure, User>> getUser(String id) async {
///   try {
///     final user = await dataSource.fetchUser(id);
///     return right(user);
///   } on SocketException {
///     return left(const Failure.network(message: 'No connection'));
///   }
/// }
/// ```
@freezed
sealed class Failure with _$Failure {
  /// Network-related failures (timeout, no connection, server error).
  const factory Failure.network({
    String? message,
    int? statusCode,
  }) = NetworkFailure;

  /// Authentication / authorization failures.
  const factory Failure.auth({
    required String reason,
  }) = AuthFailure;

  /// Input validation failures with per-field error messages.
  const factory Failure.validation({
    required Map<String, String> errors,
  }) = ValidationFailure;

  /// Local storage read/write failures.
  const factory Failure.storage({
    String? message,
  }) = StorageFailure;

  /// Requested resource not found.
  const factory Failure.notFound({
    String? entity,
    String? id,
  }) = NotFoundFailure;

  /// Rate limiting / quota exceeded.
  const factory Failure.rateLimited({
    Duration? retryAfter,
  }) = RateLimitedFailure;

  /// Permission denied (different from auth — user is authenticated but lacks access).
  const factory Failure.permissionDenied({
    String? message,
  }) = PermissionDeniedFailure;

  /// Catch-all for unexpected errors.
  const factory Failure.unknown({
    String? message,
    Object? error,
    StackTrace? stackTrace,
  }) = UnknownFailure;
}

/// Extension on [Failure] for common operations.
extension FailureX on Failure {
  /// Human-readable message suitable for UI display.
  String get displayMessage => when(
        network: (message, statusCode) =>
            message ?? 'Network error (${statusCode ?? 'unknown'})',
        auth: (reason) => reason,
        validation: (errors) => errors.values.first,
        storage: (message) => message ?? 'Storage error',
        notFound: (entity, id) => '${entity ?? 'Item'} not found',
        rateLimited: (retryAfter) => 'Too many requests. Please try again later.',
        permissionDenied: (message) => message ?? 'Permission denied',
        unknown: (message, _, __) => message ?? 'An unexpected error occurred',
      );

  /// Whether this failure is retryable.
  bool get isRetryable => switch (this) {
        NetworkFailure() => true,
        RateLimitedFailure() => true,
        StorageFailure() => true,
        _ => false,
      };
}
