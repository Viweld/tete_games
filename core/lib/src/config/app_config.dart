import 'package:core/src/config/app_runtime_mode.dart';

export 'package:core/src/config/app_runtime_mode.dart';

enum Flavor {
  prod,
  dev,
  devMock;

  String get title => switch (this) {
    Flavor.prod => prodTitle,
    Flavor.dev => devTitle,
    Flavor.devMock => devMockTitle,
  };

  static const String prodTitle = 'prod';
  static const String devTitle = 'dev';
  static const String devMockTitle = 'devMock';
}

class AppConfig {
  final Flavor flavor;
  final AppRuntimeMode runtimeMode;

  AppConfig({required this.flavor, required this.runtimeMode});

  factory AppConfig.fromFlavor(Flavor flavor, {required AppRuntimeMode runtimeMode}) {
    switch (flavor) {
      case Flavor.prod:
        break;

      case Flavor.dev:
        break;

      case Flavor.devMock:
        break;
    }

    return AppConfig(flavor: flavor, runtimeMode: runtimeMode);
  }
}
