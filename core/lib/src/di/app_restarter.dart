import 'package:core/src/di/locator.dart';
import 'package:flutter/foundation.dart';

/// Soft-restart notifier: new root widget tree after DI reset.
final ValueNotifier<int> appRestartGeneration = ValueNotifier<int>(0);

/// Restarts app DI and bumps [appRestartGeneration].
final class AppRestarter {
  AppRestarter(this._restart);

  final Future<void> Function() _restart;

  Future<void> restart() async {
    await _restart();
    appRestartGeneration.value++;
  }
}

/// Registers [AppRestarter] with the given [restart] callback.
void registerAppRestarter(Future<void> Function() restart) {
  if (appLocator.isRegistered<AppRestarter>()) {
    appLocator.unregister<AppRestarter>();
  }
  appLocator.registerLazySingleton<AppRestarter>(() => AppRestarter(restart));
}
