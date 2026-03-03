import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

/// Base failure class for unified error handling across the application
@freezed
sealed class Failure with _$Failure {
  const factory Failure.network({
    String? message,
    int? statusCode,
  }) = NetworkFailure;

  const factory Failure.auth({
    required String reason,
  }) = AuthFailure;

  const factory Failure.validation({
    required Map<String, String> errors,
  }) = ValidationFailure;

  const factory Failure.storage({
    String? message,
  }) = StorageFailure;

  const factory Failure.notFound({
    String? message,
  }) = NotFoundFailure;

  const factory Failure.unknown({
    String? message,
  }) = UnknownFailure;
}
