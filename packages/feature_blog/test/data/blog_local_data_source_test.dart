import 'package:feature_blog/feature_blog.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BlogLocalDataSourceImpl', () {
    late BlogLocalDataSourceImpl dataSource;

    setUp(() {
      dataSource = BlogLocalDataSourceImpl();
    });

    test('getPosts returns non-empty list', () async {
      final posts = await dataSource.getPosts();
      expect(posts, isNotEmpty);
    });

    test('getPosts excludes drafts', () async {
      final posts = await dataSource.getPosts();
      expect(posts.every((p) => !p.isDraft), isTrue);
    });

    test('getPosts sorted by publishedAt descending', () async {
      final posts = await dataSource.getPosts();
      for (var i = 1; i < posts.length; i++) {
        expect(
          posts[i - 1].publishedAt.isAfter(posts[i].publishedAt) ||
              posts[i - 1].publishedAt.isAtSameMomentAs(posts[i].publishedAt),
          isTrue,
        );
      }
    });

    test('getPosts filters by tag', () async {
      final posts = await dataSource.getPosts(tag: 'Flutter');
      expect(posts, isNotEmpty);
      expect(posts.every((p) => p.tags.contains('Flutter')), isTrue);
    });

    test('getPosts respects limit', () async {
      final posts = await dataSource.getPosts(limit: 1);
      expect(posts, hasLength(1));
    });

    test('getPosts respects offset', () async {
      final allPosts = await dataSource.getPosts();
      final offsetPosts = await dataSource.getPosts(offset: 1);
      expect(offsetPosts.length, allPosts.length - 1);
    });

    test('getPosts returns empty for out-of-range offset', () async {
      final posts = await dataSource.getPosts(offset: 999);
      expect(posts, isEmpty);
    });

    test('getPostBySlug returns matching post', () async {
      final post = await dataSource.getPostBySlug('clean-architecture-flutter');
      expect(post, isNotNull);
      expect(post!.slug, 'clean-architecture-flutter');
    });

    test('getPostBySlug returns null for unknown slug', () async {
      final post = await dataSource.getPostBySlug('nonexistent');
      expect(post, isNull);
    });

    test('getTags returns unique sorted tags', () async {
      final tags = await dataSource.getTags();
      expect(tags, isNotEmpty);
      // Check sorted
      final sorted = List<String>.from(tags)..sort();
      expect(tags, sorted);
      // Check unique
      expect(tags.length, tags.toSet().length);
    });
  });
}
