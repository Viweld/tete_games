# ADR-006: Lean Domain

**Статус:** Принято  
**Дата:** 2026-07-10

## Контекст

Domain не должен раздуваться «на вырост» и дублировать Repository интерфейсами Port.

## Решение

**Минимальный шаблон `features/<name>/src/domain/`:**

```
domain/
├── repositories/       # когда есть Repository
├── entities/           # когда есть модели
└── ports/              # только при cross-feature (ADR-10)
```

### Правила

- только каталоги, которые **реально используются**;
- не создавать заранее `services/`, `value_objects/`, `policies/`, `factories/`;
- Domain Model → Presentation **напрямую**, если не нужна адаптация (ADR-7);
- не дублировать Repository как `*RepositoryPort` (ADR-10).

## Последствия

- Минимальный domain в каждом feature.
- Новые папки — Directory on Demand (ADR-8).
