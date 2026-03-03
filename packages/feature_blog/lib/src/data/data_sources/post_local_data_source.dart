import 'package:injectable/injectable.dart';
import '../models/post_model.dart';

abstract class PostLocalDataSource {
  Future<List<PostModel>> getAll();
  Future<PostModel?> getById(String id);
  Future<PostModel> create(PostModel post);
  Future<PostModel> update(PostModel post);
  Future<void> delete(String id);
}

@LazySingleton(as: PostLocalDataSource)
class PostLocalDataSourceImpl implements PostLocalDataSource {
  // TODO: Implement with Drift/SQLite
  // For now, using in-memory storage
  final List<PostModel> _storage = [];

  @override
  Future<List<PostModel>> getAll() async {
    return List.from(_storage);
  }

  @override
  Future<PostModel?> getById(String id) async {
    try {
      return _storage.firstWhere((item) => item.id == id);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<PostModel> create(PostModel post) async {
    _storage.add(post);
    return post;
  }

  @override
  Future<PostModel> update(PostModel post) async {
    final index = _storage.indexWhere((item) => item.id == post.id);
    if (index != -1) {
      _storage[index] = post;
    }
    return post;
  }

  @override
  Future<void> delete(String id) async {
    _storage.removeWhere((item) => item.id == id);
  }
}
