import 'contact_item.dart';

abstract interface class ContactRepository {
  Future<List<ContactItem>> getAll();
}
