import 'package:navigation/navigation.dart';

export 'main.gr.dart';
export 'main/games_list_screen/games_list_screen.dart';
export 'main/home_screen/home_screen.dart';
export 'main/splash_screen/splash_screen.dart';
export 'src/di/configure_dependencies.module.dart';

@AutoRouterConfig(replaceInRouteName: 'Page|Screen|Popup|BottomSheet|Dialog|Drawer,Route')
class MainRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => <AutoRoute>[
    // fz:feature-routes
    AutoRoute(page: HomeRoute.page),
    AutoRoute(page: SplashRoute.page),
    AutoRoute(page: GamesListRoute.page),
  ];
}
