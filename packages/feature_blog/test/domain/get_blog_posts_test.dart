import 'package:core_domain/core_domain.dart';
import 'package:feature_blog/feature_blog.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
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
        )).thenAnswer((_) async => right([samplePost]));

    final result = await useCase(const GetBlogPostsParams());

    expect(result.isRight(), isTrue);
    result.fold(
      (_) => fail('Should be right'),
      (posts) => expect(posts, hasLength(1)),
    );
  });

  test('passes tag parameter to repository', () async {
    when(() => mockRepository.getPosts(
          tag: 'flutter',
          limit: any(named: 'limit'),
          offset: any(named: 'offset'),
        )).thenAnswer((_) async => right([]));

    await useCase(const GetBlogPostsParams(tag: 'flutter'));

    verify(() => mockRepository.getPosts(
          tag: 'flutter',
          limit: any(named: 'limit'),
          offset: any(named: 'offset'),
        )).called(1);
  });

  test('propagates failure from repository', () async {
    when(() => mockRepository.getPosts(
          tag: any(named: 'tag'),
          limit: any(named: 'limit'),
          offset: any(named: 'offset'),
        )).thenAnswer(
      (_) async => left(const Failure.network(message: 'offline')),
    );

    final result = await useCase(const GetBlogPostsParams());
    expect(result.isLeft(), isTrue);
  });
}
