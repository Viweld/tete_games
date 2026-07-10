# screen_bloc

Добавляет экран по паттерну Screen + Content + BLoC + Effect в существующий feature-пакет.

## Использование

```bash
mason make screen_bloc --feature_name orders --screen_name list
```

## Что генерируется

- `features/<feature>/lib/<feature>/<screen>/` — screen, content, bloc/
- Патчи: routes в feature router, `AppRouter`, метод навигации
- post_gen: `build_runner` в feature, navigation, core

## Требования

- Feature-пакет уже создан (`mason make feature_package` или вручную)
- В `features/<feature>/lib/<feature>.dart` есть маркер `// fz:feature-routes`
