import 'package:injectable/injectable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:core_domain/core_domain.dart';
import '../entities/contact.dart';
import '../repositories/contact_repository.dart';

@injectable
class GetContactsUseCase implements UseCaseNoParams<List<Contact>> {
  final ContactRepository _repository;

  GetContactsUseCase(this._repository);

  @override
  Future<Either<Failure, List<Contact>>> call() {
    return _repository.getAll();
  }
}
