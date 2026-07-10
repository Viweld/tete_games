# ADR-010: Repository vs StatePort vs EventPort

**Статус:** Принято  
**Дата:** 2026-07-10

## Контекст

Нужна модель **владения** (ownership), а не только «три интерфейса». Различать полный контракт данных, узкое чтение состояния и уведомление о событии.

Нет общих базовых классов `BaseRepository`, `BaseStatePort`, `BaseEventPort`.

## Модель владения

| Контракт | Владелец | Роль |
|----------|----------|------|
| **Repository** | Своя feature | Владелец **данных** своей предметной области. Следствие: SSOT для этих данных. |
| **StatePort** | **Consumer** feature (потребитель контракта) | Ограниченное **чтение** состояния другой feature. Метафора: «дать посмотреть». |
| **EventPort** | **Consumer** feature | **Уведомление** без Domain Model. Метафора: «попросить что-то сделать». Emitter — feature, инициировавшая событие. |

```text
Repository  →  данные (своя feature)
StatePort   →  дать посмотреть (чужая feature, subset)
EventPort   →  попросить сделать (инвалидация, без payload)
```

## Repository

Repository **может:** загружать, кэшировать, `Stream`, маппить transport → Domain.

Repository **не может:** знать о других feature; использоваться для межфичевого общения.

Маппинг Transport Model → Domain **только** здесь.

```dart
abstract interface class ProfileRepository {
  PlayerProfile? get profileData;
  Stream<PlayerProfile?> get profileStream;
  Future<void> saveProfile(PlayerProfile profile);
}
```

## StatePort

- не является Repository;
- не обязан возвращать полный Domain Model — только нужное consumer;
- объявляется у **потребителя**: `features/<consumer>/src/domain/ports/`.

```dart
// features/tictactoe/src/domain/ports/peer_connection_state_port.dart
abstract interface class PeerConnectionStatePort {
  bool get isConnected;
  Stream<bool> get connectionStream;
}
```

## EventPort

- не передаёт Domain Model;
- не глобальная шина;
- только между двумя feature.

```dart
abstract interface class ShellHomeInvalidationPort {
  Stream<void> get stream;
  void invalidate();
}
```

## Когда создавать Port

| Не создавать Port | Создавать Port |
|-------------------|----------------|
| Repository используется **только** своей feature | Другая feature нуждается в **subset** API без import |
| Полный API достаточен внутри feature | Нужно соблюсти DAG (`features ↛ features`) |

**Антипаттерн:** `ProfileRepositoryPort` дублирует `ProfileRepository` без subset.

## Wiring

Только Composition Root:

```dart
// lib/di/tictactoe_port_adapters.dart
void registerTictactoePorts(GetIt locator) {
  locator.registerLazySingleton<PeerConnectionStatePort>(
    () => _PeerConnectionStatePortAdapter(locator<PeerConnectionService>()),
  );
}
```

`navigation_api` — **не** место для портов (ADR-5).

## Последствия

- Cross-feature: StatePort / EventPort + adapters, не import feature→feature.
- BLoC: свой Repository + чужие порты; не чужой Repository.
