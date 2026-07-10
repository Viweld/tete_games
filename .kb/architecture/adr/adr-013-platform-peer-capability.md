# ADR-013: platform/peer — capability layer

**Статус:** Принято  
**Дата:** 2026-07-10

## Контекст

BLE-соединение, FSM и frame engine — не product logic и не чистая infrastructure. Нужен явный слой возможностей.

## Решение

`platform/peer` — **capability layer** между:

- **infrastructure** — BLE wire, transport repositories, mappers;
- **features/** — product (shell, игры).

### Platform предоставляет возможности, не продуктовые сценарии

| Правильно (platform) | Неправильно (platform) |
|------------------------|------------------------|
| `PeerConnection`, `PeerDiscovery`, `PeerSession` | `StartChessMatch`, `CreateLobby` |
| `FrameEngine`, `reduce()`, `AppConnectionFrame` | `InviteFriendUseCase` |
| Public barrels: `peer_connection.dart`, `peer_game.dart` | Импорт `features/*`, game rules |

Platform **не знает** о конкретной игре и не содержит UI overlay (overlay — в `features/shell`).

### Зависимости

- `platform/peer` → `core` (без UI);
- `features/*` → public barrels platform;
- `platform/peer` ↛ `features/*`;
- `infrastructure` → `platform/peer` (transport реализует контракты platform).

### SDK isolation

Feature **не** импортирует `flutter_blue_plus`. Допустимы domain-сервисы platform (`PeerConnectionService`) через public barrel.

## Последствия

- Продуктовые сценарии остаются в feature.
- Platform переиспользуется всеми играми без знания правил игры.
- Через годы не появляется `StartGame()` внутри `bluetooth/`.
