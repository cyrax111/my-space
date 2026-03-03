import 'package:fpdart/fpdart.dart';
import 'package:core_domain/core_domain.dart';
import '../entities/about.dart';

abstract class AboutRepository {
  Future<Either<Failure, List<About>>> getAll();
  Future<Either<Failure, About>> getById(String id);
  Future<Either<Failure, About>> create(About about);
  Future<Either<Failure, About>> update(About about);
  Future<Either<Failure, void>> delete(String id);
}
