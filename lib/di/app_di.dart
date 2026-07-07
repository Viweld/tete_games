// fz:kit-imports

import 'package:app/di/app_di.config.dart';
import 'package:core/core.dart';
import 'package:core_ui/src/di/configure_dependencies.module.dart';
import 'package:infrastructure/src/di/configure_dependencies.module.dart';
import 'package:navigation/navigation.dart';
import 'package:peer/src/di/configure_dependencies.module.dart';
import 'package:shell/shell_domain.dart';
import 'package:shell/src/di/configure_dependencies.module.dart';

@InjectableInit(
  preferRelativeImports: true,
  externalPackageModulesAfter: <ExternalModule>[
    ExternalModule(InfrastructurePackageModule),
    ExternalModule(NavigationPackageModule),
    ExternalModule(CoreUiPackageModule),
    ExternalModule(PeerPackageModule),
    // fz:external-modules
    ExternalModule(ShellPackageModule),
  ],
)
Future<void> configureDependencies({required AppRuntimeMode runtimeMode}) async {
  appLocator.registerLazySingleton<AppConfig>(() => AppConfig.create(runtimeMode: runtimeMode));

  appLocator.registerLazySingleton<LocaleController>(
    () => LocaleController(initial: AppLocalizationConfig.fallbackLocale),
  );
  appLocator.registerLazySingleton<AppEventBus>(AppEventBus.new);
  appLocator.registerLazySingleton<AppToastBus>(AppToastBus.new);
  appLocator.registerLazySingleton<AppToastMessenger>(
    () => AppToastMessenger(appLocator<AppToastBus>()),
  );

  registerAppRestarter(() async {
    await appLocator.reset();
    final AppRuntimeMode mode = await AppRuntimeModeStorage.read();
    await configureDependencies(runtimeMode: mode);
  });

  await appLocator.init();

  if (!appLocator.isRegistered<PushNotificationPreferences>()) {
    appLocator.registerLazySingleton<PushNotificationPreferences>(
      () => appLocator.get<SettingsRepository>(),
    );
  }

  if (!appLocator.isRegistered<AppNavigator>()) {
    appLocator.registerLazySingleton<AppNavigator>(appLocator.get<AppRouter>);
  }
}
