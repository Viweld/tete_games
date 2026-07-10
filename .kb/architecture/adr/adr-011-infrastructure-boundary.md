# ADR-011: Infrastructure — технические примитивы

**Статус:** Принято  
**Дата:** 2026-07-10

## Контекст

Business API в infrastructure создаёт жёсткую связь и нарушает vertical slices.

## Решение

### Запрещено в `infrastructure/`

- business-репозитории и доменные контракты product feature;
- feature-specific логика игр или shell;
- импорты `features/*`.

### Разрешено в `infrastructure/`

- SDK wrappers (SharedPreferences, Firebase Crashlytics);
- BLE **wire** transport (`ble_peer_session`, mappers transport ↔ platform);
- технические адаптеры persistence.

Граница: infrastructure знает **как** работать с SDK и wire; feature/platform знают **что** делать с доменом.

### Транспорт в tete_games

Единственный data transport между устройствами — BLE. Wire — в `infrastructure/lib/src/peer/`; FSM и frames — в `platform/peer` (ADR-13).

Crashlytics — telemetry, **не** data transport.

## Последствия

- Graph rule: `infrastructure ↛ features`.
- Игровой протокол — в feature + `peer_game` barrel, не в infrastructure.
