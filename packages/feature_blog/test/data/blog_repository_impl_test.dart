import 'package:core_domain/core_domain.dart';
import 'package:feature_blog/feature_blog.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockBlogLocalDataSource extends Mock implements BlogLocalDataSource {}

void main() {
  late MockBlogLocalDataSource mockDataSource;
  late BlogRepositoryImpl repository;

  setUp(() {
    mockDataSource = MockBlogLocalDataSource();
    repository = BlogRepositoryImpl(mockDataSource);
  });

  final sampleModel = BlogPostModel(
    id: '1',
    title: 'Test',
    slug: 'test',
    excerpt: 'Excerpt',
    content: 'Content',
    author: 'Author',
    publishedAt: DateTime(2024),
    updatedAt: DateTime(2024),
    tags: ['dart'],
  );

  group('getPosts', () {
    test('returns posts on success', () async {
      when(() => mockDataSource.getPosts(
            tag: any(named: 'tag'),
            limit: any(named: 'limit'),
            offset: any(named: 'offset'),
          )).thenAnswer((_) async => [sampleModel]);

      final posts = await repository.getPosts();
      expect(posts, hasLength(1));
      expect(posts.first.title, 'Test');
    });

    test('throws UnknownException on data source error', () async {
      when(() => mockDataSource.getPosts(
            tag: any(named: 'tag'),
            limit: any(named: 'limit'),
            offset: any(named: 'offset'),
          )).thenThrow(Exception('db error'));

      expect(
        () => repository.getPosts(),
        throwsA(isA<UnknownException>()),
      );
    });
  });

  group('getPostBySlug', () {
    test('returns post when found', () async {
      when(() => mockDataSource.getPostBySlug('test'))
          .thenAnswer((_) async => sampleModel);

      final post = await repository.getPostBySlug('test');
      expect(post.slug, 'test');
    });

    test('throws NotFoundException when post not found', () async {
      when(() => mockDataSource.getPostBySlug('missing'))
          .thenAnswer((_) async => null);

      expect(
        () => repository.getPostBySlug('missing'),
        throwsA(isA<NotFoundException>()),
      );
    });

    test('throws UnknownException on data source error', () async {
      when(() => mockDataSource.getPostBySlug(any()))
          .thenThrow(Exception('error'));

      expect(
        () => repository.getPostBySlug('x'),
        throwsA(isA<UnknownException>()),
      );
    });
  });

  group('getTags', () {
    test('returns tags on success', () async {
      when(() => mockDataSource.getTags())
          .thenAnswer((_) async => ['dart', 'flutter']);

      final tags = await repository.getTags();
      expect(tags, ['dart', 'flutter']);
    });
  });
}
