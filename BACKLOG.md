# Бэклог tete games

Отложенные задачи и заметки для быстрого восстановления контекста.

---

## Realtime-смена имени при активном peer-соединении

**Статус:** отложено  
**Временное решение:** редактирование имени отключено, пока установлено соединение (делается отдельно в UI).

### Проблема

Сейчас имя пользователя (`PlayerProfile.displayName`) используется только при старте BLE-сессии. После `CmdTransportConnected` `remoteDisplayName` берётся из `PeerSessionSnapshot.remoteEndpoint` и больше не обновляется. Смена имени в `NicknameDialog` сохраняется локально и видна только на своём устройстве (`HomeAppBarBloc` → `localDisplayName`); на втором устройстве имя остаётся прежним.

### Текущая архитектура (точки входа)

| Что | Где |
|-----|-----|
| Локальное имя в app bar | `features/shell/.../app_bar/` — `HomeAppBarBloc` ← `ProfileRepository` |
| Удалённое имя в app bar | `HomeBloc` ← `frame.state.shared.remoteDisplayName` ← `projectFrame()` ← `snapshot.remoteEndpoint` |
| Фиксация remote identity | `platform/peer/.../peer_connection_reduce.dart` — `_transportConnected` |
| Identity при старте сессии | `infrastructure/.../peer_server_session_repository_impl.dart`, `peer_client_session_repository_impl.dart` — `_buildLocalEndpoint()` |
| Сохранение никнейма | `features/shell/.../nickname_dialog/bloc/nickname_bloc.dart` |
| Session-сообщения (только handshake) | `infrastructure/.../peer_session_message_mapper.dart` — invite/accept/reject/disconnect |
| Транспорт app-сообщений | `ble_peer_session` ^0.4.2: `PeerHost`/`PeerClient.sendJson()` — **в приложении не используется** |

### План доработки (оценка: ~0.5–1 день)

Следовать `tete-peer-connection-frame.mdc` (frame-only contract, `reduce()`, без логики в UI).

1. **`NicknameBloc`**
   - При открытии диалога подставлять текущий никнейм и id.
   - При сохранении сохранять существующий `id`, менять только `displayName` *(уже реализовано: `currentProfile?.id ?? Uuid().v4()`)*.

2. **Протокол app-сообщения** (без изменений `ble_peer_session`)
   - Тип, например: `peer.app.identity.update`.
   - Payload: `{ "displayName": "<string>" }` (id не менять по wire).
   - Отправка: `sendJson` с `sender` = актуальный `PeerEndpoint` (после смены имени — обновить локальный endpoint в infrastructure-слое или передавать identity в сообщении явно).

3. **`infrastructure`**
   - Расширить `PeerTransportRepository` (или репозитории host/client): метод отправки app-сообщения + стрим входящих non-session сообщений (сейчас `sessionMessages` фильтрует только `PeerMessageTypes.isSessionType`).
   - При сохранении профиля во время `phase == connected` — вызвать отправку update.

4. **`platform/peer`**
   - Новое доменное сообщение, напр. `PeerIdentityUpdate`, или расширить `PeerSessionMessage`.
   - Команда `CmdRemoteIdentityUpdated(PeerEndpoint remoteEndpoint)` (или обновление только `displayName` при том же `id`).
   - В `reduce()`: если `phase == connected`, обновить `remoteEndpoint` через `copyWith` (новый `PeerIdentity` с тем же `id`).
   - `projectFrame()` подхватит новое `remoteDisplayName` автоматически.

5. **`PeerConnectionService`**
   - Подписка на входящие identity-update → `_dispatch(CmdRemoteIdentityUpdated(...))`.
   - Публичный метод `notifyLocalIdentityChanged()` или реакция на событие от feature-слоя после сохранения профиля.

6. **`features/shell`**
   - После успешного сохранения никнейма: если соединение активно — уведомить `PeerConnectionService`.
   - Убрать временный disable редактирования при соединении.

7. **Тесты**
   - Unit: `reduce()` — обновление `remoteEndpoint.displayName` при connected.
   - При желании: интеграционный тест mapper app-сообщения.

### Зависимости

- `ble_peer_session` 0.4.2 уже поддерживает `sendJson` / `jsonMessages` — доработка пакета не обязательна.
- Не ломать существующий handshake (invite/accept/reject/disconnect).

### Связанные файлы для старта

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
