# tete games

![tete games logo](assets/logo.png)

A mobile app for offline two-player games over Bluetooth Low Energy (BLE).  
**tete games** is a reincarnation of [ble_games](https://github.com/Viweld/ble_games) built on the [Flutterozavr](https://github.com/Viweld/flutterozavr) skeleton: Clean Architecture, multi-package workspace, and a shared design system from `core_ui`.

## About

Two devices discover each other over BLE, establish a connection, and exchange game messages — no internet required. Supports Android↔Android, iOS↔iOS, and Android↔iOS pairs.

From the predecessor **ble_games** (BaTuGa), the following are ported or in progress:

- BLE transport (`ble_peer_session`): server/client roles, peer discovery, connection flow;
- app shell: splash, home (host/client), games list stub;
- game logic and peer message codecs — planned (tic-tac-toe and more).

In the new codebase:

- **architecture** — feature packages in `features/`, layers `domain` / `data` / `core` / `navigation`;
- **state** — `flutter_bloc` + effect-based navigation and UI effects;
- **DI** — `injectable` + `get_it` (`appLocator`);
- **UI** — theme, colors, and components from `core_ui` (`AppScaffold`, `ui_kit`: buttons, inputs, `AppTextField`, etc.).

## Status

| Area | Status |
|------|--------|
| Workspace & DI | done |
| Theme & ui_kit (`core_ui`) | done (subset in use) |
| BLE transport (`data/peer`, `ble_peer_session`) | done |
| Splash / Home / Games list | done |
| Firebase bootstrap (FCM + Crashlytics hooks) | done (native config + Dart init) |
| Games (tic-tac-toe, etc.) | planned |
| `core_ui` travel widgets cleanup | planned |

## Workspace packages

| Package | Purpose |
|---------|---------|
| `core/` | DI, BLoC helpers, localization, Firebase bootstrap, utilities |
| `core_ui/` | theme (`AppTheme`, `AppColors`), `AppScaffold`, `ui_kit` |
| `domain/` | peer models, settings/push repository interfaces |
| `data/` | BLE peer layer, local settings, FCM `FirebaseMessaging` DI |
| `navigation/` | `AppRouter`, routes |
| `features/main/` | splash, home, games list, BLE connection dialogs |

## Tech stack

- Flutter 3.41+ / Dart 3.11+
- Bluetooth Low Energy (BLE) via `ble_peer_session`
- `flutter_bloc` + `bloc_concurrency`
- `freezed`, `injectable`, `auto_route`
- `firebase_core`, `firebase_messaging`, `firebase_crashlytics`
- FVM for SDK version pinning

## Getting started

```bash
fvm flutter pub get
fvm dart run build_runner build --delete-conflicting-outputs
fvm flutter run
```

## Env

Copy `.env.example` → `.env` if needed. BLE does not require a backend URL.

## Build

```bash
fvm flutter build apk
fvm flutter build ios
```
