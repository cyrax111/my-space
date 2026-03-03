import 'package:injectable/injectable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:core_domain/core_domain.dart';
import '../entities/about.dart';
import '../repositories/about_repository.dart';

@injectable
class GetAboutsUseCase implements UseCaseNoParams<List<About>> {
  final AboutRepository _repository;

  GetAboutsUseCase(this._repository);

  @override
  Future<Either<Failure, List<About>>> call() {
    return _repository.getAll();
  }
}
