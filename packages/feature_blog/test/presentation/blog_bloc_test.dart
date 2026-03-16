import 'package:bloc_test/bloc_test.dart';
import 'package:core_domain/core_domain.dart';
import 'package:feature_blog/feature_blog.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGetBlogPosts extends Mock implements GetBlogPosts {}

class MockGetBlogPostBySlug extends Mock implements GetBlogPostBySlug {}

void main() {
  late MockGetBlogPosts mockGetBlogPosts;
  late MockGetBlogPostBySlug mockGetBlogPostBySlug;

  setUp(() {
    mockGetBlogPosts = MockGetBlogPosts();
    mockGetBlogPostBySlug = MockGetBlogPostBySlug();
  });

  setUpAll(() {
    registerFallbackValue(const GetBlogPostsParams());
  });

  final samplePost = BlogPost(
    id: '1',
    title: 'Test Post',
    slug: 'test-post',
    excerpt: 'An excerpt',
    content: 'Full content',
    author: 'Author',
    publishedAt: DateTime(2024, 1, 1),
    updatedAt: DateTime(2024, 1, 1),
    tags: ['flutter'],
  );

  BlogBloc buildBloc() => BlogBloc(
        getBlogPosts: mockGetBlogPosts,
        getBlogPostBySlug: mockGetBlogPostBySlug,
      );

  group('BlogLoadRequested', () {
    blocTest<BlogBloc, BlogState>(
      'emits [loading, loaded] when getPosts succeeds',
      setUp: () {
        when(() => mockGetBlogPosts(any()))
            .thenAnswer((_) async => [samplePost]);
      },
      build: buildBloc,
      act: (bloc) => bloc.add(const BlogEvent.loadRequested()),
      expect: () => [
        const BlogState(status: BlogStatus.loading),
        BlogState(status: BlogStatus.loaded, posts: [samplePost]),
      ],
    );

    blocTest<BlogBloc, BlogState>(
      'emits [loading, error] when getPosts fails',
      setUp: () {
        when(() => mockGetBlogPosts(any()))
            .thenThrow(const NetworkException('No connection'));
      },
      build: buildBloc,
      act: (bloc) => bloc.add(const BlogEvent.loadRequested()),
      expect: () => [
        const BlogState(status: BlogStatus.loading),
        isA<BlogState>()
            .having((s) => s.status, 'status', BlogStatus.error)
            .having((s) => s.errorMessage, 'errorMessage', isNotNull),
      ],
    );

    blocTest<BlogBloc, BlogState>(
      'passes tag to use case',
      setUp: () {
        when(() => mockGetBlogPosts(any()))
            .thenAnswer((_) async => []);
      },
      build: buildBloc,
      act: (bloc) =>
          bloc.add(const BlogEvent.loadRequested(tag: 'flutter')),
      verify: (_) {
        final captured = verify(() => mockGetBlogPosts(captureAny())).captured;
        final params = captured.first as GetBlogPostsParams;
        expect(params.tag, 'flutter');
      },
    );
  });

  group('BlogPostSelected', () {
    blocTest<BlogBloc, BlogState>(
      'emits state with selectedPost when successful',
      setUp: () {
        when(() => mockGetBlogPostBySlug('test-post'))
            .thenAnswer((_) async => samplePost);
      },
      build: buildBloc,
      seed: () => BlogState(status: BlogStatus.loaded, posts: [samplePost]),
      act: (bloc) =>
          bloc.add(const BlogEvent.postSelected(slug: 'test-post')),
      expect: () => [
        BlogState(
          status: BlogStatus.loaded,
          posts: [samplePost],
          selectedPost: samplePost,
        ),
      ],
    );
  });

  group('BlogPostDeselected', () {
    blocTest<BlogBloc, BlogState>(
      'clears selected post',
      build: buildBloc,
      seed: () => BlogState(
        status: BlogStatus.loaded,
        posts: [samplePost],
        selectedPost: samplePost,
      ),
      act: (bloc) => bloc.add(const BlogEvent.postDeselected()),
      expect: () => [
        BlogState(status: BlogStatus.loaded, posts: [samplePost]),
      ],
    );
  });

  group('BlogRefreshRequested', () {
    blocTest<BlogBloc, BlogState>(
      'reloads posts',
      setUp: () {
        when(() => mockGetBlogPosts(any()))
            .thenAnswer((_) async => [samplePost]);
      },
      build: buildBloc,
      seed: () => const BlogState(status: BlogStatus.loaded),
      act: (bloc) => bloc.add(const BlogEvent.refreshRequested()),
      expect: () => [
        BlogState(status: BlogStatus.loaded, posts: [samplePost]),
      ],
    );

    blocTest<BlogBloc, BlogState>(
      'preserves posts on refresh failure',
      setUp: () {
        when(() => mockGetBlogPosts(any()))
            .thenThrow(const NetworkException('offline'));
      },
      build: buildBloc,
      seed: () => BlogState(status: BlogStatus.loaded, posts: [samplePost]),
      act: (bloc) => bloc.add(const BlogEvent.refreshRequested()),
      expect: () => [
        isA<BlogState>()
            .having((s) => s.status, 'status', BlogStatus.error)
            .having((s) => s.posts, 'posts', [samplePost])
            .having((s) => s.errorMessage, 'errorMessage', isNotNull),
      ],
    );
  });
}
