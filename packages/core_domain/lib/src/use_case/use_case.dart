import 'package:fpdart/fpdart.dart';
import '../failures/failure.dart';

/// Base use case interface
/// Returns Either<Failure, T> for type-safe error handling
abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

/// Use case with no parameters
abstract class UseCaseNoParams<Type> {
  Future<Either<Failure, Type>> call();
}

/// Synchronous use case
abstract class UseCaseSync<Type, Params> {
  Either<Failure, Type> call(Params params);
}

/// No parameters class for use cases that don't need input
class NoParams {
  const NoParams();
}
