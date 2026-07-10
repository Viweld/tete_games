import 'package:app/di/app_di.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:infrastructure/infrastructure.dart';
import 'package:navigation/navigation.dart';

Future<void> main() async {
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  await ScreenService.setPreferredOrientation();

  NativeSplashService.preserveSplash(widgetsBinding);

  await FirebaseBootstrap.initialize();

  final AppRuntimeMode runtimeMode = await AppRuntimeModeStorage.read();

  await configureDependencies(runtimeMode: runtimeMode);

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final AppRouter appRouter = appLocator<AppRouter>();
    final LocaleController localeController = appLocator<LocaleController>();

    return AnimatedBuilder(
      animation: localeController,
      builder: (BuildContext context, _) {
        return MaterialApp.router(
          theme: context.theme,
          debugShowCheckedModeBanner: false,
          localizationsDelegates: AppLocalization.localizationsDelegates,
          supportedLocales: AppLocalizationConfig.supportedLocales,
          locale: localeController.locale,
          scrollBehavior: const AppScrollBehavior(),
          routerConfig: appRouter.config(
            navigatorObservers: () => <NavigatorObserver>[appRouter.routeObserver],
          ),
          builder: (_, Widget? child) => GlobalToastHost(child: child ?? const SizedBox.shrink()),
        );
      },
    );
  }
}
