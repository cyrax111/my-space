import 'blog_item.dart';

abstract interface class BlogRepository {
  Future<List<BlogItem>> getAll();
}
