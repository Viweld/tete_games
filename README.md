# tete games

![tete games logo](assets/logo.png)

A mobile app for offline two-player games over Bluetooth Low Energy (BLE).  
**tete games** is a reincarnation of [ble_games](https://github.com/Viweld/ble_games) built on the [Flutterozavr](https://github.com/Viweld/flutterozavr) skeleton: Clean Architecture, multi-package workspace, and a shared design system from `core_ui`.

## About

Two devices discover each other over BLE, establish a connection, and exchange game messages — no internet required. Supports Android↔Android, iOS↔iOS, and Android↔iOS pairs.

From the predecessor **ble_games** (BaTuGa), the following will be ported:

- BLE transport layer (`ble_peer_session`): server/client roles, authorization, connection teardown, bidirectional standardized messaging;
- screens and features: splash, home, games list, tic-tac-toe, and more;
- game logic and peer message codecs.

In the new codebase:

- **architecture** — feature packages in `features/`, layers `domain` / `data` / `core` / `navigation`;
- **state** — `flutter_bloc` + effect-based navigation and UI effects;
- **DI** — `injectable` + `get_it` (`appLocator`);
- **UI** — theme, colors, and components from `core_ui` (`AppTheme`, `AppColors`, `ui_kit`: buttons, inputs, dialogs, `AppScaffold`, etc.).

## Status

The project is in the initialization phase: Flutterozavr skeleton is set up and `core_ui` with ui_kit is wired in. Game features and the BLE module are planned for porting from **ble_games**.

| Area | Status |
|------|--------|
| Workspace & DI | done (skeleton) |
| Theme & ui_kit (`core_ui`) | done |
| BLE transport | port from ble_games |
| Splash / Home / Games list | planned |
| Games (tic-tac-toe, etc.) | planned |

## Workspace packages

| Package | Purpose |
|---------|---------|
| `core/` | DI, BLoC helpers, localization, utilities |
| `core_ui/` | theme (`AppTheme`, `AppColors`), `AppScaffold`, `ui_kit` |
| `domain/` | freezed models, repository interfaces |
| `data/` | DTOs, Dio, repository implementations |
| `navigation/` | `AppRouter`, routes |
| `features/example/` | reference feature package (Screen + Content + BLoC + Effect) |
| `features/main/` | app shell: splash (initial route), home, games list, BLE connection dialogs (planned) |

## Tech stack

- Flutter 3.41+ / Dart 3.11+
- Bluetooth Low Energy (BLE)
- `flutter_bloc` + `bloc_concurrency`
- `freezed`, `injectable`, `auto_route`, `dio` + `retrofit`
- FVM for SDK version pinning

## Getting started

```bash
fvm flutter pub get
fvm dart run build_runner build --delete-conflicting-outputs
fvm flutter run -t lib/main_dev.dart
```

## Env

Copy `.env.example.dev` → `.env.dev`, or use the committed placeholders.

## Build

```bash
fvm flutter build apk
fvm flutter build ios
```
