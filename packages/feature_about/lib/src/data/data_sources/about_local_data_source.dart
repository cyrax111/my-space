import 'package:injectable/injectable.dart';
import '../models/about_model.dart';

abstract class AboutLocalDataSource {
  Future<List<AboutModel>> getAll();
  Future<AboutModel?> getById(String id);
  Future<AboutModel> create(AboutModel about);
  Future<AboutModel> update(AboutModel about);
  Future<void> delete(String id);
}

@LazySingleton(as: AboutLocalDataSource)
class AboutLocalDataSourceImpl implements AboutLocalDataSource {
  // TODO: Implement with Drift/SQLite
  // For now, using in-memory storage
  final List<AboutModel> _storage = [];

  @override
  Future<List<AboutModel>> getAll() async {
    return List.from(_storage);
  }

  @override
  Future<AboutModel?> getById(String id) async {
    try {
      return _storage.firstWhere((item) => item.id == id);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<AboutModel> create(AboutModel about) async {
    _storage.add(about);
    return about;
  }

  @override
  Future<AboutModel> update(AboutModel about) async {
    final index = _storage.indexWhere((item) => item.id == about.id);
    if (index != -1) {
      _storage[index] = about;
    }
    return about;
  }

  @override
  Future<void> delete(String id) async {
    _storage.removeWhere((item) => item.id == id);
  }
}
