import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import '../failures/failure.dart';

/// Base class for value objects with validation
abstract class ValueObject<T> extends Equatable {
  const ValueObject();

  Either<Failure, T> get value;

  bool get isValid => value.isRight();

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ValueObject($value)';
}
