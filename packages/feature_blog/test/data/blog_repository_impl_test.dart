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
    test('returns Right with posts on success', () async {
      when(() => mockDataSource.getPosts(
            tag: any(named: 'tag'),
            limit: any(named: 'limit'),
            offset: any(named: 'offset'),
          )).thenAnswer((_) async => [sampleModel]);

      final result = await repository.getPosts();

      expect(result.isRight(), isTrue);
      result.fold(
        (_) => fail('Should be right'),
        (posts) {
          expect(posts, hasLength(1));
          expect(posts.first.title, 'Test');
        },
      );
    });

    test('returns Left on exception', () async {
      when(() => mockDataSource.getPosts(
            tag: any(named: 'tag'),
            limit: any(named: 'limit'),
            offset: any(named: 'offset'),
          )).thenThrow(Exception('db error'));

      final result = await repository.getPosts();
      expect(result.isLeft(), isTrue);
    });
  });

  group('getPostBySlug', () {
    test('returns Right when post found', () async {
      when(() => mockDataSource.getPostBySlug('test'))
          .thenAnswer((_) async => sampleModel);

      final result = await repository.getPostBySlug('test');

      expect(result.isRight(), isTrue);
      result.fold(
        (_) => fail('Should be right'),
        (post) => expect(post.slug, 'test'),
      );
    });

    test('returns Left(NotFound) when post not found', () async {
      when(() => mockDataSource.getPostBySlug('missing'))
          .thenAnswer((_) async => null);

      final result = await repository.getPostBySlug('missing');
      expect(result.isLeft(), isTrue);
    });

    test('returns Left on exception', () async {
      when(() => mockDataSource.getPostBySlug(any()))
          .thenThrow(Exception('error'));

      final result = await repository.getPostBySlug('x');
      expect(result.isLeft(), isTrue);
    });
  });

  group('getTags', () {
    test('returns Right with tags on success', () async {
      when(() => mockDataSource.getTags())
          .thenAnswer((_) async => ['dart', 'flutter']);

      final result = await repository.getTags();

      expect(result.isRight(), isTrue);
      result.fold(
        (_) => fail('Should be right'),
        (tags) => expect(tags, ['dart', 'flutter']),
      );
    });
  });
}
