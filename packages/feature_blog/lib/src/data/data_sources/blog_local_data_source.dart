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
  Future<List<BlogPost>> call(GetBlogPostsParams params) =>
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
    try {
      final posts = await _getBlogPosts(GetBlogPostsParams(tag: event.tag));
      emit(BlogState.loaded(posts: posts));
    } on AppException catch (e) {
      emit(BlogState.error(e.message));
    }
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
    title: 'Type-Safe Error Handling with Sealed Classes',
    slug: 'type-safe-error-handling',
    excerpt:
        'Build a structured exception hierarchy using Dart 3 sealed classes '
        'for clean, exhaustive error handling.',
    content: '''
# Type-Safe Error Handling with Sealed Classes

Dart 3 sealed classes give us exhaustive pattern matching for error handling — combining the simplicity of exceptions with type safety.

## The Approach

Define a sealed exception hierarchy:

```dart
sealed class AppException implements Exception {
  final String message;
  const AppException(this.message);
}

class NetworkException extends AppException {
  final int? statusCode;
  const NetworkException(super.message, {this.statusCode});
}

class NotFoundException extends AppException {
  const NotFoundException(super.message);
}

class ValidationException extends AppException {
  final Map<String, String> fieldErrors;
  const ValidationException(super.message, {this.fieldErrors = const {}});
}
```

## Usage in Repositories

```dart
Future<User> getUser(String id) async {
  final response = await http.get(uri);
  if (response.statusCode == 404) {
    throw NotFoundException('User not found');
  }
  if (response.statusCode != 200) {
    throw NetworkException('Server error', statusCode: response.statusCode);
  }
  return User.fromJson(response.body);
}
```

## Exhaustive Handling

```dart
try {
  final user = await getUser(id);
  emit(UserLoaded(user));
} on AppException catch (e) {
  final message = switch (e) {
    NetworkException(:final statusCode) => 'Network error (\$statusCode)',
    NotFoundException() => 'User not found',
    ValidationException(:final fieldErrors) => fieldErrors.values.first,
    _ => e.message,
  };
  emit(UserError(message));
}
```

The sealed class ensures the compiler warns you if you miss a case. Clean, idiomatic Dart.
''',
    author: 'Alex',
    publishedAt: _now.subtract(const Duration(days: 21)),
    updatedAt: _now.subtract(const Duration(days: 21)),
    tags: ['Dart', 'Error Handling', 'Sealed Classes'],
    readTimeMinutes: 4,
  ),
];
