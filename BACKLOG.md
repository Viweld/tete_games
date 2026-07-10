# Бэклог tete games

Отложенные задачи и заметки для быстрого восстановления контекста.

**Последнее обновление:** 2026-07-10 (LHFA migration, push/FCM removal).

---

## Недавно закрыто

| Задача | Результат |
|--------|-----------|
| LHFA architecture canon | `.kb/architecture/` — README, glossary, ADR, anti-patterns |
| Rules & docs alignment | `.cursor/rules/`, `README.md`, `AGENTS.md` — standalone, без Flutterozavr |
| Push / FCM removal | Удалены push service, `AppEventBus`, `PushNotificationPreferences`; `SettingsRepository` — только язык |
| Mason local bricks | `bricks/feature_package`, `bricks/screen_bloc` в репозитории |
| Unit-тесты BLE FSM | `platform/peer/test/peer_connection_reduce_test.dart` — 9 тестов на `reduce()` |

**Текущие gates (локально):** `dart analyze` — 0 issues; graph — OK; peer tests — 9/9.

---

## P0 — перед production / store

### Firebase: реальные ключи

**Статус:** отложено  
**Файл:** `infrastructure/lib/src/firebase/firebase_options.dart` — placeholder `REPLACE_ME_FIREBASE_*`.

1. `flutterfire configure` для dev/prod flavors (`ios/Runner/Firebase/dev|prod/` уже есть).
2. Убрать placeholder API keys.
3. Проверить Crashlytics на реальных устройствах.

### iOS: Privacy Manifest

**Статус:** отложено  

После финализации Firebase/BLE — добавить `PrivacyInfo.xcprivacy` (Bluetooth, required reason APIs), если требует App Store review.

### iOS: обновить `Podfile.lock`

**Статус:** отложено  

После cleanup зависимостей пересоздать lock (`cd ios && pod install`).

---

## P1 — качество и устойчивость

### Тестовая дисциплина (BLE + shell)

**Статус:** в работе (база есть)  

| Область | Что добавить | Пакет |
|---------|--------------|-------|
| `reduce()` | Оставшиеся команды: invitation flow, discovery guards, `_closeSession` variants | `platform/peer` |
| `projectFrame()` / tier | Фильтрация UI events, overlay visibility | `platform/peer` |
| `HomeBloc` | `isClosed` guard, cancel подписок в `close()` | `features/shell` |
| `HomeDrawerBloc` | lifecycle + bluetooth snapshot | `features/shell` |
| Mappers | `peer_session_message_mapper`, transport DTO | `infrastructure` |

Инструменты: `bloc_test`, ручные fakes. Integration BLE — позже, с fake transport.

### Theme tokens: вычистить неиспользуемые

**Статус:** отложено  

В `AppColorsTheme` остались геттеры для удалённых виджетов (`pinfield`, `datePicker`, `orderStatus`). Убрать вместе с `app_*_theme.dart` файлами — отдельный мелкий PR.

### Дубли BLE-зависимостей в shell

**Статус:** отложено  

`features/shell/pubspec.yaml`: `device_info_plus`, `flutter_blue_plus`, `permission_handler` дублируют `infrastructure`. Рассмотреть перенос всего Bluetooth I/O в infrastructure, shell — только через `BluetoothStatusService`.

---

## P2 — продукт и архитектура

### Stress test: 2–3 независимые игры

**Статус:** в планах  

Архитектура LHFA считается подтверждённой, когда 2–3 игровые feature работают без обхода правил:

- нет feature→feature import;
- нет глобальных шин (`AppEventBus`);
- нет SDK (`ble_peer_session`, `flutter_blue_plus`) в feature;
- cross-feature — только StatePort/EventPort + `lib/di/*_port_adapters.dart`.

Кандидаты: `tictactoe`, вторая/третья простая игра.

### Первая игра (`features/game_*`)

**Статус:** в планах  

1. `mason make feature_package --feature_name tictactoe` (локальные bricks в `bricks/`).
2. Подключить в workspace, `navigation`, `lib/di/app_di.dart`, `AppRouter`.
3. Игровой протокол поверх `peer_game` barrel — отдельно от connection frame.

### Realtime-смена имени при активном peer-соединении

**Статус:** отложено  
**Временное решение:** редактирование имени отключено, пока установлено соединение (UI).

#### Проблема

Имя (`PlayerProfile.displayName`) фиксируется при `CmdTransportConnected`. `remoteDisplayName` берётся из `PeerSessionSnapshot.remoteEndpoint` и не обновляется. Смена в `NicknameDialog` видна только локально (`HomeAppBarBloc`); на втором устройстве — старое имя.

#### Точки входа

| Что | Где |
|-----|-----|
| Локальное имя в app bar | `features/shell/.../app_bar/` — `HomeAppBarBloc` ← `ProfileRepository` |
| Удалённое имя в app bar | `HomeBloc` ← `frame.state.shared.remoteDisplayName` ← `projectFrame()` |
| Фиксация remote identity | `platform/peer/.../peer_connection_reduce.dart` — `_transportConnected` |
| Identity при старте сессии | `infrastructure/.../peer_*_session_repository_impl.dart` — `_buildLocalEndpoint()` |
| Сохранение никнейма | `features/shell/.../nickname_dialog/bloc/nickname_bloc.dart` |
| Session-сообщения | `infrastructure/.../peer_session_message_mapper.dart` |
| App-сообщения по wire | `ble_peer_session`: `sendJson()` — **в приложении не используется** |

#### План (~0.5–1 день)

Следовать `tete-peer-connection-frame.mdc`.

1. Протокол `peer.app.identity.update` через `sendJson` (без изменений `ble_peer_session`).
2. `infrastructure` — стрим non-session сообщений + отправка при save profile в `connected`.
3. `platform/peer` — `CmdRemoteIdentityUpdated`, обработка в `reduce()` при `phase == connected`.
4. `PeerConnectionService` — входящие updates + `notifyLocalIdentityChanged()` после save.
5. `shell` — убрать disable редактирования при соединении.
6. **Тест:** `reduce()` — обновление `remoteEndpoint.displayName` при connected.

#### Связанные файлы

```
platform/peer/lib/src/domain/services/peer/peer_connection_reduce.dart
platform/peer/lib/src/domain/services/peer/peer_connection_project.dart
platform/peer/lib/src/domain/models/peer/peer_session_message.dart
platform/peer/lib/src/domain/models/peer/connection/peer_session_command.dart
platform/peer/lib/src/data/peer_connection_service_impl.dart
infrastructure/lib/src/peer/repositories/peer_transport_repository_impl.dart
infrastructure/lib/src/peer/repositories/peer_server_session_repository_impl.dart
infrastructure/lib/src/peer/repositories/peer_client_session_repository_impl.dart
infrastructure/lib/src/peer/mappers/peer_session_message_mapper.dart
features/shell/lib/src/presentation/home_screen/widgets/nickname_dialog/bloc/nickname_bloc.dart
features/shell/lib/src/presentation/home_screen/widgets/app_bar/bloc/home_app_bar_bloc.dart
.cursor/rules/tete-peer-connection-frame.mdc
```

---

## P3 — инструментарий (снижение стоимости ревью)

### AST / статические проверки без LLM

**Статус:** идея  

| Инструмент | Назначение | Статус |
|------------|------------|--------|
| `tool/check_workspace_graph.dart` | Граф зависимостей, cross-package `src/` | ✅ |
| `dart analyze` (scoped) | Lint + типы | ✅ CI |
| `tool/peer_ast_lint.dart` (новый) | Frame-only contract, lifecycle BLoC, запрет `package:*/src/` в features | идея |
| `.cursorignore` | Исключить `build/`, `*.freezed.dart`, `*.g.dart` из контекста агента | идея |

Цель: ловить boolean/lifecycle ошибки и нарушения границ до code review.

---

## Приоритеты (кратко)

```text
P0  Firebase keys → Podfile.lock → Privacy Manifest
P1  Тесты (reduce остаток, BLoC) → theme cleanup → shell BLE deps
P2  Stress test (2–3 игры) → первая игра → realtime nickname
P3  peer_ast_lint → .cursorignore
```
