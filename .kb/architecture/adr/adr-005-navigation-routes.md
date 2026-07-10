# ADR-005: Navigation и navigation_api

**Статус:** Принято  
**Дата:** 2026-07-10

## Контекст

Navigation не должен тянуть BLoC и domain feature-пакетов. `navigation_api` не должен становиться складом всех портов.

## Решение

### `navigation_api`

Содержит **только** контракт навигации:

- `AppNavigator` (и типы, необходимые для маршрутизации).

**Не** содержит StatePort, EventPort, bootstrap-порты.

### `navigation`

- агрегирует маршруты из feature (`AutoRoute`, path-dep на feature-пакет — принятый компромисс);
- **не** импортирует `bloc/`, `domain/`, `data/` feature.

### Cross-feature порты

Объявляются у **потребителя** в `features/<consumer>/src/domain/ports/`. Wiring — `lib/di/*_port_adapters.dart`.

## Последствия

- `navigation_api` остаётся тонким и стабильным.
- Межфичевое чтение состояния — через StatePort, не через navigation.
