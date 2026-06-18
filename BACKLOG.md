# Бэклог tete games

Отложенные задачи и заметки для быстрого восстановления контекста.

---

## Realtime-смена имени при активном peer-соединении

**Статус:** отложено  
**Временное решение:** редактирование имени отключено, пока установлено соединение (делается отдельно в UI).

### Проблема

Сейчас имя пользователя (`PlayerProfile.displayName`) используется только при старте BLE-сессии. После `CmdTransportConnected` `remoteDisplayName` берётся из `PeerSessionSnapshot.remoteEndpoint` и больше не обновляется. Смена имени в `NicknameDialog` сохраняется локально и видна только на своём устройстве (`ProfileBloc` → `HomeContent.localDisplayName`); на втором устройстве имя остаётся прежним.

### Текущая архитектура (точки входа)

| Что | Где |
|-----|-----|
| Локальное имя в app bar | `features/main/.../home_content.dart` — `profile?.displayName` из `ProfileBloc` |
| Удалённое имя в app bar | `HomeBloc` ← `frame.state.shared.remoteDisplayName` ← `projectFrame()` ← `snapshot.remoteEndpoint` |
| Фиксация remote identity | `domain/.../peer_connection_reduce.dart` — `_transportConnected` |
| Identity при старте сессии | `data/.../ble_peer_server_session_repository.dart`, `ble_peer_client_session_repository.dart` — `_buildLocalEndpoint()` |
| Сохранение никнейма | `features/main/.../nickname_dialog/bloc/nickname_bloc.dart` |
| Session-сообщения (только handshake) | `data/.../peer_session_message_mapper.dart` — invite/accept/reject/disconnect |
| Транспорт app-сообщений | `ble_peer_session` ^0.4.2: `PeerHost`/`PeerClient.sendJson()` — **в приложении не используется** |

### Известный баг (починить до или вместе с фичей)

`NicknameBloc` при каждом сохранении генерирует **новый** `player.id` (`Uuid().v4()`), вместо сохранения существующего из `IPlayerProfileRepository.getCurrentPlayer()`. Для синхронизации identity id должен быть стабильным.

### План доработки (оценка: ~0.5–1 день)

Следовать `tete-peer-connection-frame.mdc` (frame-only contract, `reduce()`, без логики в UI).

1. **`NicknameBloc`**
   - При открытии диалога подставлять текущий никнейм и id.
   - При сохранении сохранять существующий `id`, менять только `displayName`.

2. **Протокол app-сообщения** (без изменений `ble_peer_session`)
   - Тип, например: `peer.app.identity.update`.
   - Payload: `{ "displayName": "<string>" }` (id не менять по wire).
   - Отправка: `sendJson` с `sender` = актуальный `PeerEndpoint` (после смены имени — обновить локальный endpoint в data-слое или передавать identity в сообщении явно).

3. **`data`**
   - Расширить `IPeerTransportRepository` (или репозитории host/client): метод отправки app-сообщения + стрим входящих non-session сообщений (сейчас `sessionMessages` фильтрует только `PeerMessageTypes.isSessionType`).
   - При сохранении профиля во время `phase == connected` — вызвать отправку update.

4. **`domain`**
   - Новое доменное сообщение, напр. `PeerIdentityUpdate`, или расширить `PeerSessionMessage`.
   - Команда `CmdRemoteIdentityUpdated(PeerEndpoint remoteEndpoint)` (или обновление только `displayName` при том же `id`).
   - В `reduce()`: если `phase == connected`, обновить `remoteEndpoint` через `copyWith` (новый `PeerIdentity` с тем же `id`).
   - `projectFrame()` подхватит новое `remoteDisplayName` автоматически.

5. **`PeerConnectionService`**
   - Подписка на входящие identity-update → `_dispatch(CmdRemoteIdentityUpdated(...))`.
   - Публичный метод `notifyLocalIdentityChanged()` или реакция на событие от feature-слоя после сохранения профиля.

6. **`features`**
   - После успешного сохранения никнейма: если `HomeBloc.state.isConnected` — уведомить `PeerConnectionService`.
   - Убрать временный disable редактирования при соединении.

7. **Тесты**
   - Unit: `reduce()` — обновление `remoteEndpoint.displayName` при connected.
   - При желании: интеграционный тест mapper app-сообщения.

### Зависимости

- `ble_peer_session` 0.4.2 уже поддерживает `sendJson` / `jsonMessages` — доработка пакета не обязательна.
- Не ломать существующий handshake (invite/accept/reject/disconnect).

### Связанные файлы для старта

```
domain/lib/src/services/peer/peer_connection_reduce.dart
domain/lib/src/services/peer/peer_connection_project.dart
domain/lib/src/models/peer/peer_session_message.dart
domain/lib/src/models/peer/connection/peer_session_command.dart
data/lib/src/peer/peer_connection_service_impl.dart
data/lib/src/peer/repositories/ble_peer_transport_repository.dart
data/lib/src/peer/repositories/ble_peer_server_session_repository.dart
data/lib/src/peer/repositories/ble_peer_client_session_repository.dart
features/main/lib/main/home_screen/widgets/nickname_dialog/bloc/nickname_bloc.dart
features/main/lib/main/home_screen/widgets/home_app_bar/home_app_bar.dart
.cursor/rules/tete-peer-connection-frame.mdc
```
