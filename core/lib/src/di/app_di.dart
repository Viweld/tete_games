import 'package:core/core.dart';
import 'package:core/src/di/app_di.config.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
// fz:kit-imports
import 'package:navigation/navigation.dart';

final GetIt appLocator = GetIt.instance;

/// Incremented after a soft restart: new tree root with a different [ValueKey].
final ValueNotifier<int> appRestartGeneration = ValueNotifier<int>(0);

@InjectableInit(
  preferRelativeImports: true,
  externalPackageModulesAfter: <ExternalModule>[
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
  appLocator.registerLazySingleton<ErrorHandlingPolicy>(() => const ErrorHandlingPolicy());
  appLocator.registerLazySingleton<BlocErrorHandler>(
    () => BlocErrorHandler(appLocator<AppToastBus>(), appLocator<ErrorHandlingPolicy>()),
  );

  appLocator.registerLazySingleton<AppRestarter>(AppRestarter.new);

  await appLocator.init();
}

/// Soft restart: resets DI and re-initializes with the current [AppRuntimeMode] from storage.
final class AppRestarter {
  Future<void> restart() async {
    await appLocator.reset();
    final AppRuntimeMode mode = await AppRuntimeModeStorage.read();
    await configureDependencies(runtimeMode: mode);
    appRestartGeneration.value++;
  }
}
