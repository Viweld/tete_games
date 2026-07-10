# ADR-007: ViewModel — редкое исключение

**Статус:** Принято  
**Дата:** 2026-07-10

## Контекст

Не нужен отдельный presentation-слой моделей для каждого экрана.

## Решение

**По умолчанию:** `Repository → Domain Model → BLoC → Widget`.

ViewModel (`presentation/<screen>/models/`) — только если:

- экран агрегирует несколько domain-моделей в одну UI-структуру;
- независимые секции с собственной presentation-моделью;
- нужна адаптация, нецелесообразная в Domain.

## Последствия

- Меньше boilerplate.
- ViewModel — только с обоснованием в code review.
