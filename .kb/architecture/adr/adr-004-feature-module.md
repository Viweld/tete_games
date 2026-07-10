# ADR-004: Feature module — только свой модуль

**Статус:** Принято  
**Дата:** 2026-07-10

## Контекст

Feature-модули DI не должны регистрировать чужие зависимости.

## Решение

Micro-package (`@microPackageInit`) регистрирует **только** зависимости своей feature или platform/infrastructure.

### Правила

- регистрирует только зависимости **своей** области;
- **запрещено** `GetIt.instance` внутри модуля — только переданный locator;
- **не регистрирует** cross-feature port wiring — это Composition Root (`lib/di/app_di.dart`, `*_port_adapters.dart`).

## Последствия

- Cross-feature — только в Composition Root.
- Тестируемость: модуль принимает `GetIt` явно.
