import '../models/blog_post_model.dart';

/// Local data source for blog posts.
///
/// Currently uses in-memory sample data.
/// Will be replaced with Drift database in a future PR.
abstract class BlogLocalDataSource {
  /// Get all blog posts, optionally filtered by [tag].
  Future<List<BlogPostModel>> getPosts({
    String? tag,
    int? limit,
    int? offset,
  });

  /// Get a single blog post by [slug].
  Future<BlogPostModel?> getPostBySlug(String slug);

  /// Get all available tags.
  Future<List<String>> getTags();
}

/// In-memory implementation with sample data.
class BlogLocalDataSourceImpl implements BlogLocalDataSource {
  final List<BlogPostModel> _posts = _samplePosts;

  @override
  Future<List<BlogPostModel>> getPosts({
    String? tag,
    int? limit,
    int? offset,
  }) async {
    var results = _posts.where((p) => !p.isDraft).toList()
      ..sort((a, b) => b.publishedAt.compareTo(a.publishedAt));

    if (tag != null) {
      results = results.where((p) => p.tags.contains(tag)).toList();
    }

    final start = offset ?? 0;
    if (start >= results.length) return [];

    final end = limit != null ? (start + limit) : results.length;
    return results.sublist(start, end.clamp(0, results.length));
  }

  @override
  Future<BlogPostModel?> getPostBySlug(String slug) async {
    try {
      return _posts.firstWhere((p) => p.slug == slug);
    } catch (_) {
      return null;
    }
  }

  @override
  Future<List<String>> getTags() async {
    final tags = <String>{};
    for (final post in _posts) {
      tags.addAll(post.tags);
    }
    return tags.toList()..sort();
  }
}

// ─── Sample Data ──────────────────────────────────────────

final _now = DateTime.now();

final List<BlogPostModel> _samplePosts = [
  BlogPostModel(
    id: '1',
    title: 'Building Clean Architecture in Flutter',
    slug: 'clean-architecture-flutter',
    excerpt:
        'A deep dive into implementing Clean Architecture with BLoC, '
        'GoRouter, and a feature-first monorepo.',
    content: '''
# Building Clean Architecture in Flutter

Clean Architecture separates your code into layers: **Domain**, **Data**, and **Presentation**. Each layer has clear responsibilities and dependencies only flow inward.

## Why Clean Architecture?

- **Testability**: Business logic is isolated from frameworks
- **Maintainability**: Changes in one layer don't ripple through others
- **Scalability**: New features plug in without touching existing code

## The Layers

### Domain Layer
The innermost layer. Contains entities, use cases, and repository contracts. No framework dependencies.

### Data Layer
Implements repository contracts. Handles API calls, database queries, and data mapping.

### Presentation Layer
BLoC for state management, widgets for UI. Depends on domain layer only.

## Implementation

We use a monorepo with Melos to manage packages. Each feature is a separate package with its own domain, data, and presentation layers.

```dart
class GetBlogPosts extends UseCase<List<BlogPost>, GetBlogPostsParams> {
  final BlogRepository _repository;
  GetBlogPosts(this._repository);

  @override
  Future<Either<Failure, List<BlogPost>>> call(GetBlogPostsParams params) =>
      _repository.getPosts(tag: params.tag);
}
```

This approach scales beautifully as the application grows.
''',
    author: 'Alex',
    publishedAt: _now.subtract(const Duration(days: 3)),
    updatedAt: _now.subtract(const Duration(days: 3)),
    tags: ['Flutter', 'Architecture', 'Clean Code'],
    readTimeMinutes: 8,
  ),
  BlogPostModel(
    id: '2',
    title: 'Mastering BLoC Pattern for State Management',
    slug: 'mastering-bloc-pattern',
    excerpt:
        'Everything you need to know about using BLoC for predictable, '
        'testable state management in Flutter apps.',
    content: '''
# Mastering BLoC Pattern

BLoC (Business Logic Component) provides a predictable state management solution for Flutter applications.

## Core Concepts

- **Events**: User actions or system triggers
- **States**: UI representations
- **BLoC**: Transforms events into states

## Why BLoC?

1. **Separation of concerns**: Business logic lives outside widgets
2. **Testability**: Test state transitions without UI
3. **Predictability**: Unidirectional data flow

## Example

```dart
class BlogBloc extends Bloc<BlogEvent, BlogState> {
  BlogBloc(this._getBlogPosts) : super(const BlogState.initial()) {
    on<BlogLoadRequested>(_onLoadRequested);
  }

  Future<void> _onLoadRequested(
    BlogLoadRequested event,
    Emitter<BlogState> emit,
  ) async {
    emit(const BlogState.loading());
    final result = await _getBlogPosts(GetBlogPostsParams(tag: event.tag));
    result.fold(
      (failure) => emit(BlogState.error(failure.displayMessage)),
      (posts) => emit(BlogState.loaded(posts: posts)),
    );
  }
}
```

BLoC makes your Flutter apps maintainable and testable at scale.
''',
    author: 'Alex',
    publishedAt: _now.subtract(const Duration(days: 7)),
    updatedAt: _now.subtract(const Duration(days: 5)),
    tags: ['Flutter', 'BLoC', 'State Management'],
    readTimeMinutes: 6,
  ),
  BlogPostModel(
    id: '3',
    title: 'Adaptive UI: One Codebase, Every Screen',
    slug: 'adaptive-ui-flutter',
    excerpt:
        'How to build responsive Flutter layouts that adapt beautifully '
        'from phones to desktops.',
    content: '''
# Adaptive UI in Flutter

Building for multiple screen sizes doesn't mean multiple codebases. Flutter's layout system, combined with a few patterns, makes adaptive UI straightforward.

## The Three-Tier Approach

- **Compact** (< 600px): Bottom navigation, single-column
- **Medium** (600–1024px): Navigation rail, two-column possible
- **Expanded** (> 1024px): Sidebar navigation, master-detail

## Implementation

```dart
class AdaptiveScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final layoutSize = LayoutSize.fromWidth(constraints.maxWidth);
        return switch (layoutSize) {
          LayoutSize.compact => _CompactLayout(...),
          LayoutSize.medium => _MediumLayout(...),
          LayoutSize.expanded => _ExpandedLayout(...),
        };
      },
    );
  }
}
```

The key is using `LayoutBuilder` and breakpoint enums to switch between layout strategies. Each layout uses the same data — only the presentation changes.
''',
    author: 'Alex',
    publishedAt: _now.subtract(const Duration(days: 14)),
    updatedAt: _now.subtract(const Duration(days: 14)),
    tags: ['Flutter', 'UI', 'Responsive Design'],
    readTimeMinutes: 5,
  ),
  BlogPostModel(
    id: '4',
    title: 'Type-Safe Error Handling with Either',
    slug: 'type-safe-error-handling',
    excerpt:
        'Replace try-catch spaghetti with functional error handling '
        'using fpdart\'s Either type.',
    content: '''
# Type-Safe Error Handling with Either

Exceptions are invisible in Dart's type system. `Either<Failure, T>` makes errors explicit and enforceable at compile time.

## The Problem with Exceptions

```dart
// Caller has NO idea this can throw
Future<User> getUser(String id) async {
  final response = await http.get(uri);
  if (response.statusCode != 200) throw ServerException();
  return User.fromJson(response.body);
}
```

## The Either Solution

```dart
// Caller MUST handle the failure case
Future<Either<Failure, User>> getUser(String id) async {
  try {
    final response = await http.get(uri);
    if (response.statusCode != 200) {
      return left(Failure.network(statusCode: response.statusCode));
    }
    return right(User.fromJson(response.body));
  } catch (e) {
    return left(Failure.unknown(error: e));
  }
}
```

With `Either`, errors are part of the type signature. The compiler enforces handling.
''',
    author: 'Alex',
    publishedAt: _now.subtract(const Duration(days: 21)),
    updatedAt: _now.subtract(const Duration(days: 21)),
    tags: ['Dart', 'Functional Programming', 'Error Handling'],
    readTimeMinutes: 4,
  ),
];
