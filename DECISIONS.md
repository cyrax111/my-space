# Architecture Decision Records (ADRs)

Significant decisions made during the development of My Space, with context and reasoning.

---

## ADR-001: Feature-First Monorepo with Melos

**Status:** Accepted  
**Date:** 2026-03-06

### Context

We need a code organization strategy that scales with feature count while keeping each feature independently testable and swappable.

### Decision

Use a Melos-managed monorepo with one package per feature (and core packages for shared code).

### Consequences

- ✅ Each feature can be developed, tested, and reasoned about in isolation
- ✅ Dependency violations are caught at the package boundary (compile-time enforcement)
- ✅ Easy to add/remove features without touching unrelated code
- ⚠️ More packages = more `pubspec.yaml` files to maintain
- ⚠️ Melos setup has a learning curve for contributors new to monorepos

---

## ADR-002: Clean Architecture (Domain / Data / Presentation)

**Status:** Accepted  
**Date:** 2026-03-06

### Context

We need a layered architecture that separates business logic from framework code, making the core logic testable without Flutter.

### Decision

Adopt Clean Architecture with three layers per feature:

- **Domain:** Entities, use cases, repository contracts
- **Data:** Repository implementations, models, data sources
- **Presentation:** BLoC, pages, widgets

Dependencies flow inward: Presentation → Domain ← Data.

### Consequences

- ✅ Domain layer has zero framework dependencies — pure Dart
- ✅ Swapping data sources (local → API) requires no domain/presentation changes
- ✅ Business logic is fully unit-testable
- ⚠️ More boilerplate than simpler approaches
- ⚠️ Small features (like About) don't benefit as much from the full ceremony

---

## ADR-003: BLoC for State Management

**Status:** Accepted  
**Date:** 2026-03-06

### Context

Need a state management solution that is predictable, testable, and scales with app complexity.

### Decision

Use `flutter_bloc` with freezed events and states for all features.

### Alternatives Considered

| Option | Pros | Cons |
|--------|------|------|
| **BLoC** ✅ | Predictable, testable, well-documented | More boilerplate |
| Riverpod | Less boilerplate, reactive | Harder to test complex flows |
| Provider | Simple | Doesn't scale well |
| MobX | Low boilerplate | Less predictable, codegen |

### Consequences

- ✅ Unidirectional data flow makes debugging straightforward
- ✅ `bloc_test` provides excellent testing utilities
- ✅ Large community and ecosystem
- ⚠️ Event/state classes add boilerplate (mitigated by freezed)

---

## ADR-004: Sealed Exception Hierarchy for Error Handling

**Status:** Accepted (revised)  
**Date:** 2026-03-06  
**Revised:** 2026-03-08

### Context

Need a structured error handling strategy that makes expected failures visible and type-safe.

### Decision

Use a `sealed class AppException implements Exception` hierarchy with standard `try/catch` and Dart 3 exhaustive pattern matching. Removed `fpdart` (`Either<Failure, T>`) in favor of idiomatic Dart exceptions.

### Rationale for Revision

The original approach used `Either<Failure, T>` from fpdart. After review, we switched to exceptions because:

1. `Either` doesn't prevent exceptions — functions can still throw regardless
2. Adds an external dependency (`fpdart`) and unfamiliar FP patterns
3. More boilerplate (`fold`, `flatMap`, wrapping/unwrapping)
4. Dart 3 sealed classes give us exhaustive `switch` on exception subtypes anyway

### Consequences

- ✅ Idiomatic Dart — follows ecosystem conventions
- ✅ Less boilerplate (no `fold`/`Either` wrapping)
- ✅ Dart 3 sealed classes still provide exhaustive pattern matching
- ✅ No `fpdart` dependency
- ✅ Repository contracts are simpler: `Future<T>` instead of `Future<Either<Failure, T>>`
- ⚠️ No compile-time enforcement of error handling (relies on discipline + dartdoc)
- ⚠️ Must document expected exceptions via `/// Throws [...]` comments

---

## ADR-005: Freezed for Immutable Models

**Status:** Accepted  
**Date:** 2026-03-06

### Context

Need immutable data classes with equality, copyWith, and sealed union support.

### Decision

Use `freezed` for domain entities, events, states, and failures.

### Consequences

- ✅ Eliminates hand-written equality, hashCode, copyWith, toString
- ✅ Sealed classes enable exhaustive pattern matching (Dart 3 `switch`)
- ⚠️ Requires `build_runner` code generation step
- ⚠️ Generated `.freezed.dart` files add to repo noise (excluded from analysis)

---

## ADR-006: GoRouter for Navigation

**Status:** Accepted  
**Date:** 2026-03-06

### Context

Need declarative, URL-based routing that works on web (deep links, browser back button) and mobile.

### Decision

Use `go_router` with a `ShellRoute` for the adaptive navigation scaffold.

### Consequences

- ✅ URL-based routing works naturally on web
- ✅ ShellRoute keeps navigation persistent across page transitions
- ✅ Type-safe path parameters (`:slug`)
- ⚠️ Complex nested routing can be tricky to debug

---

## ADR-007: GetIt for Dependency Injection

**Status:** Accepted  
**Date:** 2026-03-06

### Context

Need a simple DI solution to wire up repositories, use cases, and BLoCs.

### Decision

Use `get_it` with manual registration (no code generation). Keep a single `setupServiceLocator()` function.

### Alternatives Considered

- **Injectable (codegen):** More automation but adds build complexity
- **Manual construction:** Simplest but doesn't scale

### Consequences

- ✅ Simple, no codegen needed
- ✅ Lazy singletons for data sources/repos, factories for BLoCs
- ⚠️ No compile-time verification of registrations (runtime errors on missing deps)

---

## ADR-008: Adaptive UI with Three-Tier Breakpoints

**Status:** Accepted  
**Date:** 2026-03-06

### Context

App targets phones, tablets, and desktops from a single codebase.

### Decision

Define three layout tiers:

| Tier | Width | Navigation |
|------|-------|-----------|
| Compact | < 600px | Bottom nav bar |
| Medium | 600–1024px | Navigation rail |
| Expanded | > 1024px | Persistent sidebar |

Implement via `AdaptiveScaffold` + `ResponsiveBuilder` in `core_ui`.

### Consequences

- ✅ Consistent adaptive behavior across all pages
- ✅ Layout logic is centralized, not duplicated per page
- ✅ Master-detail ready on expanded layouts
- ⚠️ Three tiers might not cover all edge cases (foldables, etc.)

---

## ADR-009: Material 3 with Inter Font

**Status:** Accepted  
**Date:** 2026-03-06

### Context

Need a modern, professional design system.

### Decision

Use Material 3 (`useMaterial3: true`) with the Inter font family via `google_fonts`. Define custom design tokens (colors, spacing, shadows) in `core_ui`.

### Consequences

- ✅ Native Material 3 look on Android, professional on web/desktop
- ✅ Dark mode support out of the box via `ThemeMode.system`
- ✅ Consistent spacing/shadow tokens prevent ad-hoc magic numbers
- ⚠️ Google Fonts requires network on first load (falls back to system font)

---

## ADR-010: In-Memory Data Sources (MVP)

**Status:** Accepted  
**Date:** 2026-03-06

### Context

For the initial PR, we don't have a backend. Need sample data to demonstrate the architecture.

### Decision

Implement `*LocalDataSourceImpl` classes with hardcoded sample data. These implement the same interface that future API/database sources will implement.

### Consequences

- ✅ Architecture is fully wired — data → domain → presentation
- ✅ Swapping to real data sources later requires only new implementations, no interface changes
- ⚠️ Sample data is static and limited
- ⚠️ Must remember to replace before production
