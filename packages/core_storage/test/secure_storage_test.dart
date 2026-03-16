import 'package:core_storage/core_storage.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('InMemorySecureStorage', () {
    late InMemorySecureStorage storage;

    setUp(() {
      storage = InMemorySecureStorage();
    });

    test('read returns null for missing key', () async {
      expect(await storage.read('missing'), isNull);
    });

    test('write then read returns value', () async {
      await storage.write('token', 'abc123');
      expect(await storage.read('token'), 'abc123');
    });

    test('write overwrites existing value', () async {
      await storage.write('key', 'old');
      await storage.write('key', 'new');
      expect(await storage.read('key'), 'new');
    });

    test('delete removes key', () async {
      await storage.write('key', 'val');
      await storage.delete('key');
      expect(await storage.read('key'), isNull);
    });

    test('deleteAll clears everything', () async {
      await storage.write('a', '1');
      await storage.write('b', '2');
      await storage.deleteAll();
      expect(await storage.read('a'), isNull);
      expect(await storage.read('b'), isNull);
    });

    test('containsKey returns true for existing key', () async {
      await storage.write('key', 'val');
      expect(await storage.containsKey('key'), isTrue);
    });

    test('containsKey returns false for missing key', () async {
      expect(await storage.containsKey('nope'), isFalse);
    });
  });
}
