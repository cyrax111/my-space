import 'package:fpdart/fpdart.dart';
import 'package:core_domain/core_domain.dart';
import '../entities/contact.dart';

abstract class ContactRepository {
  Future<Either<Failure, List<Contact>>> getAll();
  Future<Either<Failure, Contact>> getById(String id);
  Future<Either<Failure, Contact>> create(Contact contact);
  Future<Either<Failure, Contact>> update(Contact contact);
  Future<Either<Failure, void>> delete(String id);
}
