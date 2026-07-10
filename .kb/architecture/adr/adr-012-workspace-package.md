# ADR-012: Критерии workspace-пакета

**Статус:** Принято  
**Дата:** 2026-07-10

## Контекст

Риск чрезмерной фрагментации (один экран = один пакет).

## Решение

Новый workspace-пакет — **только если**:

- самостоятельный bounded context (feature, platform capability);
- удаляется независимо;
- собственные маршруты, состояние и/или данные;
- **либо** shared/kernel (`core`, `core_ui`, `navigation*`, `infrastructure`).

Экраны — внутри `features/<context>/src/presentation/`, не отдельные пакеты.

### `platform/peer`

Отдельный пакет как **capability layer** (ADR-13), не как feature.

### `shared_domain`

Отдельный пакет только по ADR-9 (второй независимый владелец типа).

## Последствия

- Один пакет = bounded context, capability или shared kernel.
- Feature удаляется целиком (кроме wiring в `app_di` + routes в `navigation`).
