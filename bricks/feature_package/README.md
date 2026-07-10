# feature_package

Создаёт пакет `features/<feature_name>/` и подключает его в workspace, navigation и DI.

## Использование

Из корня Flutter-приложения (после `mason get`):

```bash
mason make feature_package --feature_name orders
```

## Что генерируется

- `features/<feature_name>/` — pubspec, DI (`@microPackageInit`), barrel с `FeatureRouter`
- Патчи (post_gen): корневой `pubspec.yaml`, `navigation/`, `app_di.dart`

## Следующий шаг

Добавьте экран:

```bash
mason make screen_bloc --feature_name orders --screen_name list
```

Затем:

```bash
fvm dart run build_runner build --delete-conflicting-outputs
fvm flutter analyze
```
