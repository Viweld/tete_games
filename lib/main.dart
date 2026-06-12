import 'dart:developer';

import 'package:core/core.dart';
import 'package:navigation/navigation.dart';

Future<void> main() async {
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  await ScreenService.setPreferredOrientation();

  NativeSplashService.preserveSplash(widgetsBinding);

  try {
    await dotenv.load();
  } on Object catch (error) {
    log('Could not load .env: $error');
    rethrow;
  }

  await FirebaseBootstrap.initialize();

  final AppRuntimeMode runtimeMode = await AppRuntimeModeStorage.read();

  await configureDependencies(runtimeMode: runtimeMode);

  runApp(
    ValueListenableBuilder<int>(
      valueListenable: appRestartGeneration,
      builder: (BuildContext context, int _, Widget? child) {
        return App(key: ValueKey<int>(appRestartGeneration.value));
      },
    ),
  );
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
          builder: (BuildContext context, Widget? child) =>
              GlobalToastHost(child: child ?? const SizedBox.shrink()),
        );
      },
    );
  }
}
