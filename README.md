# My Space 🚀

A modern, cross-platform personal portfolio and blog application built with Flutter, following Clean Architecture principles.

[![Flutter](https://img.shields.io/badge/Flutter-3.0%2B-blue.svg)](https://flutter.dev/)
[![Dart](https://img.shields.io/badge/Dart-3.0%2B-blue.svg)](https://dart.dev/)
[![License](https://img.shields.io/badge/license-MIT-purple.svg)](LICENSE)

## ✨ Features

- 📱 **Cross-Platform**: iOS, Android, Web, macOS, Windows, Linux
- 🎨 **Adaptive UI**: Responsive layouts for all screen sizes
- 📝 **Blog**: Share your thoughts and articles
- 💼 **Portfolio**: Showcase your projects
- 👤 **About**: Personal information and skills
- 📧 **Contact**: Get in touch form
- 🌙 **Dark Mode**: Full dark theme support
- ♿ **Accessible**: Screen reader support and keyboard navigation

## 🏗️ Architecture

This project follows **Clean Architecture** with a **feature-first** approach in a **monorepo** structure.

### Key Principles

- **SOLID** principles throughout
- **Separation of Concerns**: Domain, Data, Presentation layers
- **Dependency Inversion**: Abstractions over concretions
- **Testability**: 95%+ unit test coverage target
- **Type Safety**: Strong typing with sealed classes and Either

### Tech Stack

| Layer | Technology |
|-------|-----------|
| State Management | BLoC (flutter_bloc) |
| Navigation | GoRouter with typed routes |
| Dependency Injection | Injectable (compile-time) |
| Local Database | SQLite with Drift |
| Networking | Dio (future) |
| Serialization | Freezed + json_serializable |
| UI Components | Material 3 |
| Fonts | Google Fonts (Inter) |

## 📁 Project Structure

```
my-space/
├── packages/
│   ├── core_domain/          # 🎯 Base entities, failures, use cases
│   ├── core_ui/              # 🎨 Design system, theme, adaptive layouts
│   ├── core_logging/         # 📊 Logging abstraction
│   ├── core_storage/         # 💾 SQLite/Drift database
│   ├── feature_blog/         # 📝 Blog feature
│   ├── feature_portfolio/    # 💼 Portfolio feature
│   ├── feature_about/        # 👤 About feature
│   └── feature_contact/      # 📧 Contact feature
├── apps/
│   └── my_space/            # 🚀 Main application
├── melos.yaml               # 📦 Monorepo configuration
└── ARCHITECTURE.md          # 📖 Detailed architecture docs
```

### Feature Structure

Each feature follows this pattern:

```
feature_name/
├── domain/
│   ├── entities/           # Pure business objects
│   ├── repositories/       # Repository interfaces
│   └── use_cases/          # Business logic
├── data/
│   ├── models/            # Data models (DTOs)
│   ├── repositories/      # Repository implementations
│   └── data_sources/      # Local/Remote data sources
└── presentation/
    ├── bloc/              # State management
    ├── pages/             # Screen widgets
    └── widgets/           # Reusable components
```

## 🚀 Getting Started

### Prerequisites

```bash
# Flutter SDK (3.0+)
flutter --version

# Dart SDK (3.0+)
dart --version

# Melos (for monorepo management)
dart pub global activate melos
```

### Installation

```bash
# 1. Clone the repository
git clone https://github.com/cyrax111/my-space.git
cd my-space

# 2. Bootstrap all packages
melos bootstrap

# 3. Generate code (freezed, injectable, json_serializable)
melos run build:runner

# 4. Run the app
cd apps/my_space
flutter run
```

### Platform-Specific Setup

#### iOS
```bash
cd apps/my_space/ios
pod install
flutter run -d iphone
```

#### Android
```bash
flutter run -d android
```

#### Web
```bash
flutter run -d chrome
```

#### Desktop (macOS/Windows/Linux)
```bash
flutter run -d macos    # macOS
flutter run -d windows  # Windows
flutter run -d linux    # Linux
```

## 🛠️ Development

### Melos Commands

```bash
# Run all tests
melos run test

# Run only unit tests
melos run test:unit

# Run integration tests
melos run test:integration

# Analyze all packages
melos run analyze

# Format all packages
melos run format

# Generate code for all packages
melos run build:runner

# Watch mode for code generation
melos run build:runner:watch

# Clean all packages
melos run clean

# Deep clean (removes all generated files)
melos run clean:deep
```

### Running Tests

```bash
# All tests with coverage
flutter test --coverage

# Specific test file
flutter test test/domain/use_cases/get_posts_use_case_test.dart

# With coverage report
flutter test --coverage
genhtml coverage/lcov.info -o coverage/html
open coverage/html/index.html
```

### Code Generation

When you modify:
- Freezed classes (`@freezed`)
- JSON serialization (`@JsonSerializable`)
- Injectable classes (`@injectable`)

Run:
```bash
melos run build:runner
```

## 📱 Responsive Design

The app adapts to different screen sizes:

| Size | Width | Navigation | Pattern |
|------|-------|-----------|---------|
| **Compact** | < 600px | Bottom Bar | Mobile optimized |
| **Medium** | 600-1024px | Navigation Rail | Tablet optimized |
| **Expanded** | > 1024px | Side Panel | Desktop master-detail |

## 🧪 Testing Strategy

### Unit Tests (95%+ coverage)
- Domain layer: Entities, use cases, value objects
- Data layer: Repositories, models, data sources
- Presentation layer: BLoCs

```dart
blocTest<PostBloc, PostState>(
  'emits [Loading, Loaded] when LoadPosts succeeds',
  build: () => PostBloc(mockUseCase),
  act: (bloc) => bloc.add(const PostEvent.loadPosts()),
  expect: () => [
    const PostState.loading(),
    PostState.loaded(posts),
  ],
);
```

### Widget Tests
- Page layouts
- Widget interactions
- Responsive layouts

### Integration Tests
- End-to-end user flows
- Navigation flows
- Data persistence

## 🎨 Design System

### Colors

```dart
Primary: #2563EB (Professional Blue)
Accent: #10B981 (Success Green)
Background Light: #FAFAFA
Background Dark: #0F172A
```

### Typography

- **Font Family**: Inter (Google Fonts)
- **Scale**: Material Design 3 type scale
- **Weights**: 400 (Regular), 500 (Medium), 600 (Semibold), 700 (Bold)

### Components

- **Cards**: 16px border radius, subtle borders
- **Buttons**: 12px border radius, clear states
- **Inputs**: Outlined style, 2px focus indicator

## 📊 Performance

### Targets

- **Startup**: < 2 seconds to first frame
- **Frame Budget**: < 16ms (60 FPS)
- **Memory**: < 200MB idle on mid-range devices
- **App Size**: < 15MB (release build, Android)

### Optimization

- Tree shaking enabled
- Code splitting for web
- Image optimization
- Lazy loading

## 🔒 Security

- No hardcoded secrets
- Input validation on all forms
- Type-safe error handling
- Secure storage for sensitive data (planned)

## 🌍 Internationalization

The app is ready for internationalization:

```dart
// Future support for:
- English (en)
- Spanish (es)
- French (fr)
// Add more as needed
```

## ♿ Accessibility

- Semantic labels on all interactive elements
- Keyboard navigation support
- Screen reader compatible
- High contrast ratios
- Adjustable text sizes

## 📈 Roadmap

### Phase 1: Foundation ✅
- [x] Project structure
- [x] Core packages
- [x] Feature scaffolds
- [x] Design system
- [x] Adaptive layouts

### Phase 2: Core Features 🚧
- [ ] Blog CRUD operations
- [ ] Portfolio management
- [ ] Contact form backend
- [ ] Rich text editor

### Phase 3: Enhancement 📅
- [ ] Image upload and optimization
- [ ] Offline support
- [ ] Search functionality
- [ ] Tags and categories

### Phase 4: Polish 📅
- [ ] Animations and transitions
- [ ] Performance optimization
- [ ] SEO for web
- [ ] App store deployment

## 🤝 Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository
2. Create a feature branch: `git checkout -b feature/amazing-feature`
3. Follow the architecture patterns
4. Write tests (aim for 95%+ coverage)
5. Run: `melos run analyze && melos run test`
6. Commit: `git commit -m 'Add amazing feature'`
7. Push: `git push origin feature/amazing-feature`
8. Create a Pull Request

### Code Style

- Follow [Effective Dart](https://dart.dev/guides/language/effective-dart)
- Use `dart format` before committing
- Write meaningful commit messages
- Add tests for new features

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- [Flutter Team](https://flutter.dev) for the amazing framework
- [BLoC Library](https://bloclibrary.dev) for state management
- [Felix Angelov](https://github.com/felangel) for BLoC architecture
- [Robert C. Martin](https://blog.cleancoder.com) for Clean Architecture

## 📞 Contact

- **GitHub**: [@cyrax111](https://github.com/cyrax111)
- **Telegram**: [@Cyrax111](https://t.me/Cyrax111)

## 📚 Resources

- [Architecture Documentation](./ARCHITECTURE.md)
- [Flutter Documentation](https://docs.flutter.dev)
- [Clean Architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)
- [BLoC Pattern](https://bloclibrary.dev)

---

**Built with ❤️ using Flutter and Clean Architecture**

*Made by Alexander Bosak*
