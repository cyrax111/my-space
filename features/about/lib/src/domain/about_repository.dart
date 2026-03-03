import 'about_item.dart';

abstract interface class AboutRepository {
  Future<List<AboutItem>> getAll();
}
