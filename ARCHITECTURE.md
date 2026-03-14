# My Space - Architecture Documentation

## Overview

My Space is a cross-platform portfolio application built with Flutter, following Clean Architecture principles with a feature-first monorepo approach.

## Architecture Principles

### SOLID Principles
- **S**ingle Responsibility: Each class has one reason to change
- **O**pen/Closed: Open for extension, closed for modification
- **L**iskov Substitution: Subtypes must be substitutable for their base types
- **I**nterface Segregation: Many client-specific interfaces are better than one general-purpose interface
- **D**ependency Inversion: Depend on abstractions, not concretions

### Clean Architecture
```
┌─────────────────────────────────────┐
│         Presentation Layer          │
│  (BLoC, Pages, Widgets)            │
│  - UI/UX components                │
│  - State management                │
└──────────────┬──────────────────────┘
               │
┌──────────────▼──────────────────────┐
│          Domain Layer               │
│  (Entities, Use Cases, Repositories)│
│  - Business logic                   │
│  - Pure Dart (no Flutter)          │
└──────────────┬──────────────────────┘
               │
┌──────────────▼──────────────────────┐
│           Data Layer                │
│  (Models, Repositories, DataSources)│
│  - API/Database communication       │
│  - Data transformation             │
└─────────────────────────────────────┘
```

## Project Structure

```
my-space/
├── packages/
│   ├── core_domain/          # Base domain entities and failures
│   ├── core_ui/              # Design system and adaptive layouts
│   ├── core_logging/         # Logging abstraction
│   ├── core_storage/         # SQLite with Drift
│   ├── core_network/         # HTTP client abstraction
│   ├── core_platform/        # Platform-specific abstractions
│   ├── feature_blog/         # Blog feature
│   ├── feature_portfolio/    # Portfolio feature
│   ├── feature_about/        # About feature
│   └── feature_contact/      # Contact feature
├── apps/
│   └── my_space/            # Main application
└── melos.yaml               # Monorepo configuration
```

## Feature Structure

Each feature follows this structure:

```
feature_name/
├── domain/
│   ├── entities/           # Pure business objects
│   ├── repositories/       # Repository interfaces
│   └── use_cases/          # Business logic operations
├── data/
│   ├── models/            # Data models (DTOs)
│   ├── repositories/      # Repository implementations
│   └── data_sources/      # Remote/Local data sources
├── presentation/
│   ├── bloc/              # State management
│   ├── pages/             # Screen widgets
│   └── widgets/           # Reusable UI components
└── di/                    # Dependency injection module
```

## State Management

**BLoC Pattern (Business Logic Component)**

- Separates business logic from UI
- Testable without UI
- Predictable state changes
- Stream-based

```dart
// Event
sealed class BlogEvent {}
class LoadPosts extends BlogEvent {}

// State
sealed class BlogState {}
class BlogLoading extends BlogState {}
class BlogLoaded extends BlogState {
  final List<Post> posts;
}

// BLoC
class BlogBloc extends Bloc<BlogEvent, BlogState> {
  // Business logic here
}
```

## Navigation

**GoRouter with Typed Routes**

- Type-safe navigation
- Deep linking support
- Shell routes for nested navigation
- Auth guards centralized

```dart
@TypedGoRoute<HomeRoute>(path: '/home')
class HomeRoute extends GoRouteData {}
```

## Dependency Injection

**Injectable (compile-time)**

- Fast startup (no runtime reflection)
- Clear dependency graphs
- Easy to test with mocks

```dart
@injectable
class GetPostsUseCase {
  final PostRepository repository;
  GetPostsUseCase(this.repository);
}
```

## Responsive Design Strategy

### Breakpoints
- **Compact** (< 600px): Phones - Bottom navigation
- **Medium** (600-1024px): Tablets - Navigation rail
- **Expanded** (> 1024px): Desktop/Web - Side panel + master-detail

### Adaptive Scaffold
Automatically adjusts navigation pattern based on screen size.

```dart
AdaptiveScaffold(
  destinations: [...],
  body: content,
)
```

## Data Layer

### Storage: SQLite with Drift
- Type-safe queries
- Compile-time SQL validation
- Automatic migrations
- Multi-table support

### Error Handling
Unified `Failure` hierarchy:
- `NetworkFailure`: API/connectivity issues
- `AuthFailure`: Authentication problems
- `ValidationFailure`: Input validation errors
- `StorageFailure`: Database errors
- `NotFoundFailure`: Resource not found
- `UnknownFailure`: Unexpected errors

Use `Either<Failure, T>` for type-safe error handling.

## Testing Strategy

### Unit Tests (95%+ coverage target)
- Domain layer: Use cases, entities
- Data layer: Repositories, models
- Presentation layer: BLoCs

```dart
blocTest<BlogBloc, BlogState>(
  'emits BlogLoaded when LoadPosts succeeds',
  build: () => BlogBloc(mockUseCase),
  act: (bloc) => bloc.add(LoadPosts()),
  expect: () => [BlogLoading(), BlogLoaded(posts)],
);
```

### Widget Tests
- UI components
- Page layouts
- Responsive behavior

### Integration Tests
- End-to-end user flows
- Navigation
- Data persistence

### Golden Tests
- UI snapshots
- Cross-platform consistency

## Performance Budgets

- **Startup time**: < 2s to first frame
- **Frame budget**: < 16ms (60fps)
- **Memory**: < 200MB idle on mid-range devices

## Security

- **Secure storage**: Tokens in iOS Keychain / Android Keystore
- **Certificate pinning**: Optional for sensitive APIs
- **Input validation**: All user inputs validated

## Observability

### Logging
```dart
logger.info('User logged in', {'userId': user.id});
logger.error('Failed to load posts', error: e, stackTrace: st);
```

### Analytics
```dart
analytics.logEvent('post_viewed', {'postId': post.id});
```

### Crash Reporting
```dart
crashReporter.recordError(error, stackTrace, fatal: true);
```

## Localization & Accessibility

- **intl + ARB files**: Multi-language support
- **Semantics**: Screen reader compatible
- **VoiceOver/TalkBack**: Full navigation support
- **Keyboard shortcuts**: Desktop support

## CI/CD Pipeline

```yaml
jobs:
  - lint: flutter analyze
  - format: dart format --set-exit-if-changed
  - test: dart run melos run test
  - coverage: Upload to Codecov
  - build: All platforms (iOS/Android/Web/Desktop)
```

## Development Commands

```bash
# Bootstrap all packages
dart run melos bootstrap

# Run all tests
dart run melos run test

# Generate code (freezed, json_serializable, etc.)
dart run melos run build:runner

# Analyze all packages
dart run melos run analyze

# Format code
dart run melos run format

# Run specific feature tests
cd packages/feature_blog && flutter test
```

## Design System

### Colors
- Primary: Professional blue (#2563EB)
- Accent: Green (#10B981)
- Background: Clean whites/grays
- Dark mode: Slate tones

### Typography
- Font: Inter (Google Fonts)
- Scale: Material Design 3 type scale
- Weight: 400 (regular), 500 (medium), 600 (semibold), 700 (bold)

### Components
- Cards: Rounded corners (16px), subtle borders
- Buttons: Rounded (12px), clear hierarchy
- Inputs: Outlined, clear focus states

## Platform Support

- ✅ iOS (iPhone, iPad)
- ✅ Android (Phone, Tablet)
- ✅ Web (Chrome, Safari, Firefox, Edge)
- ✅ macOS
- ✅ Windows
- ✅ Linux

## Roadmap

### Phase 1: Foundation (Current)
- [x] Project structure
- [x] Core packages
- [x] Design system
- [ ] Feature scaffolds

### Phase 2: Features
- [ ] Blog CRUD
- [ ] Portfolio projects
- [ ] About page
- [ ] Contact form

### Phase 3: Enhancement
- [ ] Image optimization
- [ ] Offline support
- [ ] Search functionality
- [ ] RSS feed

### Phase 4: Polish
- [ ] Animations
- [ ] Performance optimization
- [ ] SEO (Web)
- [ ] App store deployment

## Contributing

1. Create feature branch: `git checkout -b feature/name`
2. Follow architecture patterns
3. Write tests (aim for 95%+ coverage)
4. Run `dart run melos run analyze && dart run melos run test`
5. Create PR with description

## Resources

- [Flutter Documentation](https://docs.flutter.dev)
- [BLoC Library](https://bloclibrary.dev)
- [GoRouter](https://pub.dev/packages/go_router)
- [Drift](https://drift.simonbinder.eu)
- [Injectable](https://pub.dev/packages/injectable)

---

**Built with ❤️ using Flutter and Clean Architecture**
