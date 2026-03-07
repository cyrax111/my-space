/// Base contract for all use cases in the application.
///
/// Use cases encapsulate a single piece of business logic.
/// They accept [Params] and return [Type], throwing [AppException]
/// subtypes for expected failures.
///
/// ```dart
/// class GetPosts extends UseCase<List<Post>, GetPostsParams> {
///   final PostRepository _repository;
///   GetPosts(this._repository);
///
///   @override
///   Future<List<Post>> call(GetPostsParams params) =>
///       _repository.getPosts(limit: params.limit);
/// }
/// ```
abstract class UseCase<Type, Params> {
  /// Execute the use case with the given [params].
  ///
  /// Throws [AppException] subtypes for expected failures.
  Future<Type> call(Params params);
}

/// Use case that requires no parameters.
///
/// ```dart
/// class GetAllPosts extends UseCaseNoParams<List<Post>> {
///   @override
///   Future<List<Post>> call() => repository.getAll();
/// }
/// ```
abstract class UseCaseNoParams<Type> {
  /// Execute the use case.
  Future<Type> call();
}

/// Synchronous use case for CPU-bound operations.
abstract class UseCaseSync<Type, Params> {
  /// Execute the use case synchronously.
  Type call(Params params);
}

/// Synchronous use case with no parameters.
abstract class UseCaseSyncNoParams<Type> {
  /// Execute the use case synchronously.
  Type call();
}

/// Stream-based use case for reactive data.
///
/// ```dart
/// class WatchPosts extends StreamUseCase<List<Post>, NoParams> {
///   @override
///   Stream<List<Post>> call(NoParams params) =>
///       repository.watchAll();
/// }
/// ```
abstract class StreamUseCase<Type, Params> {
  /// Execute the use case returning a stream.
  Stream<Type> call(Params params);
}

/// Stream-based use case with no parameters.
abstract class StreamUseCaseNoParams<Type> {
  /// Execute the use case returning a stream.
  Stream<Type> call();
}

/// Sentinel class for use cases that don't need input.
class NoParams {
  const NoParams();
}
