import 'package:fpdart/fpdart.dart';

import '../failures/failure.dart';

/// Base contract for all use cases in the application.
///
/// Use cases encapsulate a single piece of business logic.
/// They accept [Params] and return [Either<Failure, Type>],
/// making error handling explicit and type-safe.
///
/// ```dart
/// class GetPosts extends UseCase<List<Post>, GetPostsParams> {
///   final PostRepository _repository;
///   GetPosts(this._repository);
///
///   @override
///   Future<Either<Failure, List<Post>>> call(GetPostsParams params) =>
///       _repository.getPosts(limit: params.limit);
/// }
/// ```
abstract class UseCase<Type, Params> {
  /// Execute the use case with the given [params].
  Future<Either<Failure, Type>> call(Params params);
}

/// Use case that requires no parameters.
///
/// ```dart
/// class GetAllPosts extends UseCaseNoParams<List<Post>> {
///   @override
///   Future<Either<Failure, List<Post>>> call() => repository.getAll();
/// }
/// ```
abstract class UseCaseNoParams<Type> {
  /// Execute the use case.
  Future<Either<Failure, Type>> call();
}

/// Synchronous use case for CPU-bound operations.
abstract class UseCaseSync<Type, Params> {
  /// Execute the use case synchronously.
  Either<Failure, Type> call(Params params);
}

/// Synchronous use case with no parameters.
abstract class UseCaseSyncNoParams<Type> {
  /// Execute the use case synchronously.
  Either<Failure, Type> call();
}

/// Stream-based use case for reactive data.
///
/// ```dart
/// class WatchPosts extends StreamUseCase<List<Post>, NoParams> {
///   @override
///   Stream<Either<Failure, List<Post>>> call(NoParams params) =>
///       repository.watchAll();
/// }
/// ```
abstract class StreamUseCase<Type, Params> {
  /// Execute the use case returning a stream.
  Stream<Either<Failure, Type>> call(Params params);
}

/// Stream-based use case with no parameters.
abstract class StreamUseCaseNoParams<Type> {
  /// Execute the use case returning a stream.
  Stream<Either<Failure, Type>> call();
}

/// Sentinel class for use cases that don't need input.
class NoParams {
  const NoParams();
}
