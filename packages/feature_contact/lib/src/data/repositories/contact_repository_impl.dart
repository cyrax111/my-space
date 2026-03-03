import 'package:injectable/injectable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:core_domain/core_domain.dart';
import '../../domain/entities/contact.dart';
import '../../domain/repositories/contact_repository.dart';
import '../data_sources/contact_local_data_source.dart';
import '../models/contact_model.dart';

@LazySingleton(as: ContactRepository)
class ContactRepositoryImpl implements ContactRepository {
  final ContactLocalDataSource _localDataSource;

  ContactRepositoryImpl(this._localDataSource);

  @override
  Future<Either<Failure, List<Contact>>> getAll() async {
    try {
      final models = await _localDataSource.getAll();
      return Right(models.map((m) => m.toEntity()).toList());
    } catch (e) {
      return Left(Failure.storage(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Contact>> getById(String id) async {
    try {
      final model = await _localDataSource.getById(id);
      if (model == null) {
        return const Left(Failure.notFound());
      }
      return Right(model.toEntity());
    } catch (e) {
      return Left(Failure.storage(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Contact>> create(Contact contact) async {
    try {
      final model = ContactModel.fromEntity(contact);
      final created = await _localDataSource.create(model);
      return Right(created.toEntity());
    } catch (e) {
      return Left(Failure.storage(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Contact>> update(Contact contact) async {
    try {
      final model = ContactModel.fromEntity(contact);
      final updated = await _localDataSource.update(model);
      return Right(updated.toEntity());
    } catch (e) {
      return Left(Failure.storage(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> delete(String id) async {
    try {
      await _localDataSource.delete(id);
      return const Right(null);
    } catch (e) {
      return Left(Failure.storage(message: e.toString()));
    }
  }
}
