import 'package:navigation_api/navigation_api.dart';
import 'package:shell/shell.dart';

@AutoRouterConfig(replaceInRouteName: 'Page|Screen|Popup|BottomSheet|Dialog|Drawer,Route')
class AppRouter extends RootStackRouter implements AppNavigator {
  final AutoRouteObserver routeObserver = AutoRouteObserver();

  @override
  List<AutoRoute> get routes => <AutoRoute>[
    // workspace:routes
    AutoRoute(page: HomeRoute.page),
    AutoRoute(page: SplashRoute.page, initial: true),
  ];

  @override
  Future<void> navigateBack([Object? result]) => maybePop(result);

  @override
  Future<void> navigateRoot() => replaceAll(<PageRouteInfo<Object?>>[const HomeRoute()]);

  @override
  Future<void> navigateHome() => push(const HomeRoute());

  // workspace:navigate-methods
}
