# Anti-patterns

Шпаргалка: «можно ли так?» — быстрее, чем длинные ADR.

## Нельзя

| Паттерн | Почему |
|---------|--------|
| Feature A → Feature B (прямой import) | Нарушает DAG; coupling |
| BLoC → BLoC (сквозная связь presentation) | Обход Application Layer |
| Repository → Repository чужой feature | Чужие данные без порта |
| Feature → FlutterBluePlus (и др. transport SDK) | SDK isolation; только platform/infrastructure |
| AppEventBus / глобальная шина | Нет владельца, границ и scope; неограниченное распространение событий |
| Platform → game logic (`StartChessMatch`, `CreateLobby`) | Platform — capabilities, не product (ADR-13) |
| `UserRepositoryPort` дублирует `UserRepository` | Port без subset; см. ADR-010 «Когда создавать Port» |
| Пустые папки «на вырост» | Directory on Demand (ADR-8) |
| `shared_domain` «на будущее» | Только второй независимый владелец (ADR-9) |

## Правильно

| Сценарий | Решение |
|----------|---------|
| Feature B читает часть состояния Feature A | StatePort у **B** + adapter в Composition Root |
| Feature A уведомляет Feature B | EventPort у **B** + adapter; B сам решает refresh |
| Feature использует BLE | Public barrel `platform/peer` (`peer_connection`, `peer_game`) |
| UI показывает данные | Widget → BLoC → **свой** Repository → Domain |
| Склейка контрактов | `lib/di/app_di.dart`, `lib/di/*_port_adapters.dart` |

## AppEventBus — почему удалён

Не формальное «нарушение ADR», а архитектурная причина:

- нет владельца области ответственности;
- нет границ распространения событий;
- любой подписчик на любое событие;
- превращается в глобальный канал между feature.

**Замена:** локальные EventPort у потребителя.
