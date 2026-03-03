# Architecture Decisions (my-space)

## 1) Feature-first monorepo
Each feature (`blog`, `portfolio`, `about`, `contact`) is an independent package with internal layers:
- `domain`
- `application`
- `data`
- `presentation`

This keeps ownership clear and enables parallel work.

## 2) Clean boundaries
- Domain should stay pure and UI-agnostic.
- App package is only a composition root and routing host.
- Core packages provide reusable abstractions (platform, observability, flags, security).

## 3) Adaptive shell strategy
A single `AdaptiveScaffold` changes nav patterns by width class:
- compact: bottom nav
- medium: nav rail
- expanded: drawer/sidebar style

This ensures one domain/app flow while adapting UX to platform size.

## 4) Navigation and deep links
`go_router` with `StatefulShellRoute.indexedStack` keeps tabs stateful and ready for typed routes generation.

## 5) Testing strategy toward 95%
- Domain/use-case/bloc tests as primary target for high coverage.
- Widget tests for adaptive shell behavior.
- Integration tests for critical user journeys.
- Keep infra abstractions mockable to test all app behavior without UI.

## 6) Security & resilience by design
- Secure storage abstraction in core layer.
- Unified failure model in core domain.
- Observability interfaces for logging/crash/analytics providers.
- Feature flags for gradual rollout.

## 7) Performance budgets (target)
- cold start < 2.0s on mid-range mobile
- frame build budget <= 16ms for interaction-critical screens
- memory budget defined per platform profile in CI performance runs
