# Architecture Guide

## Overview

My Space follows **Clean Architecture** with a **feature-first monorepo** structure managed by Melos. Each feature is an independent Dart package with domain, data, and presentation layers.

## Principles

1. **Dependency Rule** — Dependencies point inward. Domain has zero framework deps.
2. **Feature Isolation** — Features don't import each other. Communication goes through the app shell or shared core packages.
3. **Explicit Errors** — Expected failures use a sealed `AppException` hierarchy with Dart 3 pattern matching.
4. **Immutability** — All domain entities use Freezed for compile-time immutability.

## Package Categories

### Core Packages

Shared infrastructure consumed by features. No business logic.

| Package | Purpose |
|---|---|
| `core_domain` | Base entities, exceptions (`AppException` sealed class), value objects |
| `core_ui` | Design system: theme (Material 3 + Inter), adaptive scaffold, responsive builder, 10+ widgets |
| `core_logging` | Pluggable logger abstraction (console, composite) |
| `core_analytics` | Analytics provider interface (noop, composite) |
| `core_feature_flags` | Runtime feature toggles with in-memory provider |
| `core_storage` | Database and secure storage abstractions |

### Feature Packages

Each feature follows this internal structure:

```
feature_xxx/
└── lib/src/
    ├── domain/
    │   ├── entities/       # Freezed immutable entities
    │   ├── repositories/   # Abstract contracts
    │   └── use_cases/      # Single-responsibility business logic
    ├── data/
    │   ├── models/         # Data transfer objects with fromJson/toJson
    │   ├── data_sources/   # Local/remote data source interfaces + impls
    │   └── repositories/   # Concrete repository implementations
    └── presentation/
        ├── bloc/           # BLoC (events, states, bloc class)
        ├── pages/          # Full-screen page widgets
        └── widgets/        # Feature-specific reusable widgets
```

## State Management: BLoC

Every feature uses BLoC for state management:

```dart
Event → BLoC → State
```

- **Events** are Freezed sealed classes (type-safe, exhaustive switching)
- **States** are Freezed sealed classes
- **BLoC** maps events to states using use cases

Benefits:
- Testable without UI (pure event→state transforms)
- Predictable (unidirectional data flow)
- Debuggable (BlocObserver, DevTools integration)

## Error Handling

The `AppException` sealed class hierarchy:

```
AppException
├── NetworkException          (message, statusCode)
├── AuthException             (message)
├── ValidationException       (message, fieldErrors: Map<String, String>)
├── StorageException          (message)
├── NotFoundException         (message, entity, id)
├── RateLimitedException      (message, retryAfter)
├── PermissionDeniedException (message)
└── UnknownException          (message, cause, stackTrace)
```

Repositories throw `AppException` subtypes for expected failures. BLoCs catch them:

```dart
try {
  final posts = await getBlogPosts(params);
  emit(State.loaded(posts: posts));
} on AppException catch (e) {
  emit(State.error(message: e.message));
}
```

Dart 3 exhaustive pattern matching on the sealed class:

```dart
final message = switch (e) {
  NetworkException(:final statusCode) => 'Network error ($statusCode)',
  NotFoundException() => 'Not found',
  ValidationException(:final fieldErrors) => fieldErrors.values.first,
  _ => e.message,
};
```

## Navigation: GoRouter

- Shell route provides adaptive navigation scaffold
- Feature routes are nested under the shell
- Type-safe route constants in `AppRoutes`
- `NoTransitionPage` for tab-like switching
- Blog detail uses path parameters (`/blog/:slug`)

## Dependency Injection: GetIt

Manual registration in `service_locator.dart`:

```
Data Sources → Repositories → Use Cases → BLoCs
```

Lazy singletons for data sources and repositories (shared state). Factories for use cases and BLoCs (fresh instances per use).

## Adaptive Layout System

Three-tier layout matching Material 3 adaptive guidelines:

1. **`LayoutSize.compact`** (< 600px) — Bottom navigation, single column
2. **`LayoutSize.medium`** (600–1024px) — Navigation rail, potential two-column
3. **`LayoutSize.expanded`** (> 1024px) — Persistent sidebar, master-detail

Key components:
- `AdaptiveScaffold` — Switches navigation mode based on screen width
- `ResponsiveBuilder` — Widget factory per breakpoint
- `SliverAdaptivePadding` — Consistent horizontal padding with max-width constraint

## Design System (core_ui)

- **Colors**: Professional Blue (#2563EB) primary, Amber (#F59E0B) accent
- **Typography**: Inter font (Google Fonts), Material 3 type scale
- **Spacing**: 8px grid system
- **Components**: AppCard (hover animation), SkillBar, AnimatedGradientText, SocialIconButton, TagChip, LoadingIndicator, ErrorView, EmptyState
- **Theme**: Full light & dark mode with ColorScheme

## Value Objects

Type-safe domain primitives that validate on construction:

- `EmailAddress` — Regex-validated, lowercased
- `NonEmptyString` — Trim + length checks
- `Slug` — URL-safe alphanumeric with hyphens
- `UrlValue` — Parsed URI with scheme validation

All throw `ValidationException` on invalid input. Each also provides a `tryCreate` static method that returns `null` instead of throwing.

## Testing Strategy

```
Unit Tests          → Domain (use cases, entities, value objects)
                    → Data (repositories, models)
                    → BLoC (event → state transitions via bloc_test)

Widget Tests        → Individual widgets
                    → Pages with mocked BLoCs

Integration Tests   → End-to-end feature flows
```

Target: 90%+ coverage on domain and data layers.
