# my-space

Adaptive Flutter monorepo for a personal website/app (`Blog`, `Portfolio`, `About`, `Contact`).

## Stack

- Clean Architecture + SOLID
- Monorepo (`melos`) with feature-first packages
- State management: `flutter_bloc`
- Navigation: `go_router` with shell navigation
- DI: `injectable` (planned codegen wiring)
- Persistence: SQLite abstraction in `core_data` (Drift-ready)
- Immutable models: `freezed` in feature packages (ready to extend)

## Monorepo Layout

- `apps/my_space_app` → composition root and adaptive shell app
- `packages/core/*` → shared cross-cutting concerns
- `features/*` → isolated feature packages

## Adaptive UX

Breakpoints:
- `compact < 600`: bottom navigation
- `medium 600-1024`: navigation rail
- `expanded > 1024`: side drawer + content pane

Implemented in `core_ui.AdaptiveScaffold`.

## Quality

CI workflow includes:
- format + analyze + tests
- architecture and coverage gates can be tightened to 95% when the full feature implementation lands.

## Run

```bash
melos bootstrap
melos run check
flutter run -d chrome -t apps/my_space_app/lib/main.dart
```
