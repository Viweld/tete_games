# Глоссарий

Термины Lean Hexagonal Feature Architecture для tete_games.

## Архитектура

| Термин | Простыми словами |
|--------|------------------|
| **Feature** | Независимый продуктовый модуль: shell, игра. Свои domain, data, presentation. |
| **Bounded context** | Смысловая область с собственными моделями и правилами. Один feature ≈ один context. |
| **Ownership** | Кто владеет данными, контрактом порта, событием. Центральная идея архитектуры. |
| **Repository** | Владелец данных своей предметной области feature. Единственное место маппинга transport → Domain. |
| **SSOT** | Single Source of Truth — **следствие** того, что Repository владеет данными. |
| **StatePort** | Узкий контракт у **потребителя**: «дать посмотреть» часть состояния другой feature. |
| **EventPort** | Узкий контракт у **потребителя**: «попросить сделать» (инвалидация) без передачи Domain Model. |
| **Composition Root** | `lib/di/app_di.dart` — единственное место wiring impl → contracts и port adapters. |
| **Capability layer** | `platform/peer` — возможности (соединение, frames), не игровые сценарии. |

## Слои в feature

| Термин | Простыми словами |
|--------|------------------|
| **Domain** | Контракты и модели без Flutter и без transport SDK. |
| **Data** | Реализации Repository, persistence, маппинг transport → Domain. |
| **Presentation** | Screen, Content, BLoC, widgets. |
| **BLoC** | Application Layer: orchestration, Effects. Не владелец данных. |
| **Effect** | Разовое UI-действие: навигация, диалог. BLoC эмитит, Screen выполняет. |
| **Transport Model** | Модель wire-уровня (BLE session message и т.п.). Не покидает data/infrastructure. |

## Пакеты workspace

| Пакет | Роль |
|-------|------|
| `core` | appLocator, BLoC helpers, localization, технические порты |
| `core_ui` | Дизайн-система, ui_kit |
| `infrastructure` | SDK, SharedPreferences, BLE wire, Crashlytics |
| `platform/peer` | BLE FSM, frames, PeerConnectionService |
| `navigation_api` | **Только** `AppNavigator` |
| `navigation` | AppRouter, агрегация маршрутов |
| `features/*` | Product features |

## Межфичевое взаимодействие

| Термин | Простыми словами |
|--------|------------------|
| **Port adapter** | Регистрация в `lib/di/*_port_adapters.dart`: Port → Repository или platform service. |
| **Public barrel** | `peer_connection.dart`, `peer_game.dart` — единственный допустимый import platform из feature. |

## Lean

| Термин | Простыми словами |
|--------|------------------|
| **Directory on Demand** | Папка появляется, когда есть реальный код, не «на вырост». |
| **shared_domain** | Workspace-пакет только после **второго независимого владельца** типа (ADR-9). |
