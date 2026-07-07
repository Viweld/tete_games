import 'package:core/core.dart';
import 'package:core_ui/src/di/configure_dependencies.module.dart';
import 'package:data/src/di/configure_dependencies.module.dart';
import 'package:domain/src/di/configure_dependencies.module.dart';
import 'package:infrastructure/src/di/configure_dependencies.module.dart';
import 'package:main/src/di/configure_dependencies.module.dart';
import 'package:navigation/navigation.dart';
// fz:kit-imports

import 'app_di.config.dart';

@InjectableInit(
  preferRelativeImports: true,
  externalPackageModulesAfter: <ExternalModule>[
    ExternalModule(InfrastructurePackageModule),
    ExternalModule(NavigationPackageModule),
    ExternalModule(CoreUiPackageModule),
    ExternalModule(DataPackageModule),
    ExternalModule(DomainPackageModule),
    // fz:external-modules
    ExternalModule(MainPackageModule),
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
  appLocator.registerLazySingleton<ErrorHandlingPolicy>(() => const ErrorHandlingPolicy());
  appLocator.registerLazySingleton<BlocErrorHandler>(
    () => BlocErrorHandler(appLocator<AppToastBus>(), appLocator<ErrorHandlingPolicy>()),
  );

  registerAppRestarter(() async {
    await appLocator.reset();
    final AppRuntimeMode mode = await AppRuntimeModeStorage.read();
    await configureDependencies(runtimeMode: mode);
  });

  await appLocator.init();

  if (!appLocator.isRegistered<AppNavigator>()) {
    appLocator.registerLazySingleton<AppNavigator>(appLocator.get<AppRouter>);
  }
}
