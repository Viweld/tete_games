# Lean Hexagonal Feature Architecture

> **Статус:** принят как архитектурный канон tete_games. Изменения — только через ADR с явной причиной.

Точка входа для разработчиков. Читать **до** [adr/](adr/).

## Иерархия источников

```text
.kb/architecture/   ←  канон (этот документ + ADR)
.cursor/rules/      ←  операционные правила
код                 ←  реализация
README.md           ←  вход для человека (не канон)
```

## Философия

Архитектура строится вокруг **ownership** (кто чем владеет), а не вокруг каталогов `domain/` / `data/` / `presentation/`.

Сквозные принципы:

| Принцип | Суть |
|---------|------|
| **Ownership** | Feature владеет своими данными; Repository — владелец данных своей области |
| **Lean** | Ничего заранее: пакеты, папки, абстракции — только при доказанной необходимости (ADR-8) |
| **Hexagonal** | Межфичевое взаимодействие — через узкие порты, не через import |
| **Feature First** | Feature — основная единица композиции и владения |
| **Composition Root** | Единственная точка связывания — `lib/di/app_di.dart` и `*_port_adapters.dart` |
| **Capability layers** | Platform даёт возможности, не продуктовые сценарии (ADR-13) |
| **Architecture as Code** | ADR + graph checker + rules |

## Три вида контрактов

| Контракт | Роль | Метафора |
|----------|------|----------|
| **Repository** | Владелец **данных** своей feature | «Где живут и откуда читаются мои данные» |
| **StatePort** | Владелец контракта — **consumer**; чтение ограниченного состояния чужой feature | «Дать посмотреть» |
| **EventPort** | Владелец контракта — **consumer**; уведомление без Domain Model | «Попросить что-то сделать» |

Repository **не** используется для общения между feature. SSOT — **следствие** ownership, не определение.

Подробности: [adr/adr-010-repository-vs-port.md](adr/adr-010-repository-vs-port.md).

## Жизненный цикл данных

**Чтение (inbound):**

```text
Transport → Transport Model → Repository → Domain → BLoC → Widget
```

**Запись (outbound):**

```text
Widget → BLoC → Repository → Transport Model → Transport
```

Маппинг Transport Model → Domain **только** в Repository. BLoC не знает SDK и transport-моделей.

## Продукт и транспорт

**Продукт:** offline peer-to-peer игры на двух устройствах.

**Транспорт в данном проекте:** BLE (`platform/peer` + BLE wire в `infrastructure`). Архитектура описана transport-агностично; BLE — контекст продукта, не определение архитектуры.

## Запрет на «ADR ради идеала»

Новые ADR и папки в `domain/` — **только по факту новой необходимости** (ADR-8). Не предусматривать всё заранее.

## Дальнейшая проверка

Архитектура считается подтверждённой, когда 2–3 независимые игровые feature работают без обхода правил (прямых import feature→feature, глобальных шин, SDK в feature).

Будущие case studies (не сейчас): `.kb/architecture/case-studies/` — реальные истории «была проблема → почему сделали так».

## Документы

| Документ | Назначение |
|----------|------------|
| [00-glossary-simple.md](00-glossary-simple.md) | Термины |
| [09-anti-patterns.md](09-anti-patterns.md) | «Так делать нельзя» |
| [adr/](adr/) | Архитектурные решения |
