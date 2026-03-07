import 'package:core_domain/core_domain.dart';
import 'package:feature_blog/feature_blog.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockBlogRepository extends Mock implements BlogRepository {}

void main() {
  late MockBlogRepository mockRepository;
  late GetBlogPosts useCase;

  setUp(() {
    mockRepository = MockBlogRepository();
    useCase = GetBlogPosts(mockRepository);
  });

  final samplePost = BlogPost(
    id: '1',
    title: 'Test',
    slug: 'test',
    excerpt: 'Excerpt',
    content: 'Content',
    author: 'Author',
    publishedAt: DateTime(2024),
    updatedAt: DateTime(2024),
  );

  test('returns posts from repository', () async {
    when(() => mockRepository.getPosts(
          tag: any(named: 'tag'),
          limit: any(named: 'limit'),
          offset: any(named: 'offset'),
        )).thenAnswer((_) async => [samplePost]);

    final posts = await useCase(const GetBlogPostsParams());
    expect(posts, hasLength(1));
  });

  test('passes tag parameter to repository', () async {
    when(() => mockRepository.getPosts(
          tag: 'flutter',
          limit: any(named: 'limit'),
          offset: any(named: 'offset'),
        )).thenAnswer((_) async => []);

    await useCase(const GetBlogPostsParams(tag: 'flutter'));

    verify(() => mockRepository.getPosts(
          tag: 'flutter',
          limit: any(named: 'limit'),
          offset: any(named: 'offset'),
        )).called(1);
  });

  test('propagates exception from repository', () async {
    when(() => mockRepository.getPosts(
          tag: any(named: 'tag'),
          limit: any(named: 'limit'),
          offset: any(named: 'offset'),
        )).thenThrow(const NetworkException('offline'));

    expect(
      () => useCase(const GetBlogPostsParams()),
      throwsA(isA<NetworkException>()),
    );
  });
}
