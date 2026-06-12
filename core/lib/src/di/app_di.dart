import 'package:core/core.dart';
import 'package:core/src/di/app_di.config.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:navigation/navigation.dart';
// fz:kit-imports
import 'package:main/main.dart';

final GetIt appLocator = GetIt.instance;

/// Incremented after a soft restart: new tree root with a different [ValueKey].
final ValueNotifier<int> appRestartGeneration = ValueNotifier<int>(0);

const String unauthScope = 'unauthScope';
const String authScope = 'authScope';

@InjectableInit(
  preferRelativeImports: true,
  externalPackageModulesAfter: <ExternalModule>[
    ExternalModule(NavigationPackageModule),
    ExternalModule(CoreUiPackageModule),
    ExternalModule(DataPackageModule),
    ExternalModule(DomainPackageModule),
    // fz:external-modules
    ExternalModule(MainPackageModule),
    ExternalModule(ExamplePackageModule),
  ],
)
Future<void> configureDependencies({
  required Flavor flavor,
  required AppRuntimeMode runtimeMode,
}) async {
  appLocator.registerLazySingleton<AppConfig>(
    () => AppConfig.fromFlavor(flavor, runtimeMode: runtimeMode),
  );

  appLocator.registerLazySingleton<LocaleController>(
    () => LocaleController(initial: AppLocalizationConfig.fallbackLocale),
  );
  appLocator.registerLazySingleton<CurrencyController>(
    () => CurrencyController(initialCurrencyCode: CurrencyController.defaultCurrencyCode),
  );
  appLocator.registerLazySingleton<AppEventBus>(AppEventBus.new);
  appLocator.registerLazySingleton<AppToastBus>(AppToastBus.new);
  appLocator.registerLazySingleton<ErrorHandlingPolicy>(() => const ErrorHandlingPolicy());
  appLocator.registerLazySingleton<BlocErrorHandler>(
    () => BlocErrorHandler(appLocator<AppToastBus>(), appLocator<ErrorHandlingPolicy>()),
  );

  appLocator.registerLazySingleton<AppRestarter>(() => AppRestarter(flavor));

  await appLocator.init(environment: flavor.title);
}

/// Soft restart: resets DI and re-initializes with the current [AppRuntimeMode] from storage.
final class AppRestarter {
  AppRestarter(this._flavor);

  final Flavor _flavor;

  Future<void> restart() async {
    await appLocator.reset();
    final AppRuntimeMode mode = await AppRuntimeModeStorage.read();
    await configureDependencies(flavor: _flavor, runtimeMode: mode);
    appRestartGeneration.value++;
  }
}
