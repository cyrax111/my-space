import 'package:injectable/injectable.dart';
import '../models/contact_model.dart';

abstract class ContactLocalDataSource {
  Future<List<ContactModel>> getAll();
  Future<ContactModel?> getById(String id);
  Future<ContactModel> create(ContactModel contact);
  Future<ContactModel> update(ContactModel contact);
  Future<void> delete(String id);
}

@LazySingleton(as: ContactLocalDataSource)
class ContactLocalDataSourceImpl implements ContactLocalDataSource {
  // TODO: Implement with Drift/SQLite
  // For now, using in-memory storage
  final List<ContactModel> _storage = [];

  @override
  Future<List<ContactModel>> getAll() async {
    return List.from(_storage);
  }

  @override
  Future<ContactModel?> getById(String id) async {
    try {
      return _storage.firstWhere((item) => item.id == id);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<ContactModel> create(ContactModel contact) async {
    _storage.add(contact);
    return contact;
  }

  @override
  Future<ContactModel> update(ContactModel contact) async {
    final index = _storage.indexWhere((item) => item.id == contact.id);
    if (index != -1) {
      _storage[index] = contact;
    }
    return contact;
  }

  @override
  Future<void> delete(String id) async {
    _storage.removeWhere((item) => item.id == id);
  }
}
