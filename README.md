# My Space

Personal portfolio & blog built with Flutter — one codebase, every platform.

## ✨ Features

- **Blog** — Technical articles with tag filtering and detail views
- **Portfolio** — Project showcase with type filtering and responsive grid
- **About** — Profile, skills (animated bars), and experience timeline
- **Contact** — Validated form with real-time field validation

## 🏗️ Architecture

Clean Architecture with a feature-first monorepo.

```
my-space/
├── apps/
│   └── my_space/           # Main Flutter app (shell, router, DI)
├── packages/
│   ├── core_domain/        # Entities, failures, use cases, value objects
│   ├── core_ui/            # Design system, theme, widgets, adaptive layouts
│   ├── core_logging/       # Pluggable logging abstraction
│   ├── core_analytics/     # Analytics provider interface
│   ├── core_feature_flags/ # Runtime feature toggling
│   ├── core_l10n/          # Localization support
│   ├── core_storage/       # Database & secure storage contracts
│   ├── feature_blog/       # Blog feature (domain → data → presentation)
│   ├── feature_portfolio/  # Portfolio feature
│   ├── feature_about/      # About/profile feature
│   └── feature_contact/    # Contact form feature
└── melos.yaml              # Monorepo orchestration
```

### Stats

- **130 files** (113 Dart, 17 config/docs)
- **7,300+ lines** of Dart
- **11 packages** (7 core + 4 features)
- **5 documentation files**

### Layer Dependencies

```
Presentation → Domain ← Data
     ↓            ↑        ↓
   BLoC      Use Cases   Data Sources
   Pages     Entities    Models
   Widgets   Failures    Repositories (impl)
```

## 🛠️ Tech Stack

| Category | Choice |
|---|---|
| Framework | Flutter 3.27+ |
| Language | Dart 3.6+ |
| State Management | BLoC (flutter_bloc) |
| Navigation | GoRouter |
| DI | GetIt |
| Monorepo | Melos |
| Error Handling | Sealed AppException hierarchy (Dart 3) |
| Immutability | Freezed |
| Theme | Material 3 + Inter font |

## 🚀 Quick Start

### Prerequisites

- Flutter 3.27+
- Dart 3.6+

### Setup

```bash
# Clone
git clone https://github.com/cyrax111/my-space.git
cd my-space

# Install workspace dependencies (including Melos)
dart pub get

# Bootstrap all packages
dart run melos bootstrap

# Run the app
cd apps/my_space
flutter run -d chrome      # Web
flutter run -d macos       # macOS
flutter run -d <device>    # Mobile
```

### Development

```bash
dart run melos run analyze          # Lint all packages
dart run melos run format           # Format all packages
dart run melos run test             # Test all packages
dart run melos run build:runner     # Code generation (freezed, etc.)
```

## 📱 Adaptive UI

Three-tier responsive layout:

| Screen | Navigation | Layout |
|---|---|---|
| < 600px (phone) | Bottom nav bar | Single column |
| 600–1024px (tablet) | Navigation rail | Two column possible |
| > 1024px (desktop) | Persistent sidebar | Master-detail |

## 📝 Documentation

- [ARCHITECTURE.md](ARCHITECTURE.md) — Detailed architecture guide
- [DECISIONS.md](DECISIONS.md) — Architecture Decision Records (ADRs)

## 📄 License

MIT
