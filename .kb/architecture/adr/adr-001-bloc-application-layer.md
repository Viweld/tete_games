# ADR-001: BLoC = Application Layer

**Статус:** Принято  
**Дата:** 2026-07-10

## Контекст

Нужен единый слой orchestration без отдельного UseCase-слоя.

## Решение

BLoC отвечает за **orchestration** (Controller / Presenter / Coordinator).

**BLoC не является источником истины.** Владелец данных — `Repository` (ADR-10). Запрещено долгоживущее бизнес-состояние в полях BLoC (`_cachedProfile`, `_cachedSession`).

### Разрешено

- вызывать свой `Repository` и чужие `StatePort` / `EventPort`;
- последовательность async-операций, ветвление сценария;
- работа с **Domain Model** в State (UI-состояние экрана, не кэш домена);
- генерация `State` и `Effect`.

### Запрещено

- transport-модели, BLE SDK, SharedPreferences напрямую;
- `BuildContext`, навигация, диалоги (только Effects);
- кэширование доменных данных вне `Repository`;
- import чужого `*Repository` (нужен StatePort/EventPort).

**Нет** UseCases. **Нет** Mapper в BLoC — transport → Domain только в `Repository` (ADR-010).

## Последствия

- Меньше слоёв, явная ответственность BLoC.
- Code review: отклонять `_cached*` бизнес-данные в BLoC.
