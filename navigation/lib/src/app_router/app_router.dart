import 'package:auto_route/auto_route.dart';
import 'package:shell/shell.dart';
import 'package:navigation_api/navigation_api.dart';

@AutoRouterConfig(replaceInRouteName: 'Page|Screen|Popup|BottomSheet|Dialog|Drawer,Route')
class AppRouter extends RootStackRouter implements AppNavigator {
  final AutoRouteObserver routeObserver = AutoRouteObserver();

  @override
  List<AutoRoute> get routes => <AutoRoute>[
    // fz:routes
    AutoRoute(page: HomeRoute.page),
    AutoRoute(page: SplashRoute.page, initial: true),
  ];

  @override
  Future<void> navigateBack([Object? result]) => maybePop(result);

  @override
  Future<void> navigateRoot() => replaceAll(<PageRouteInfo<Object?>>[HomeRoute()]);

  @override
  Future<void> navigateHome() => push(HomeRoute());

  @override
  Future<void> navigateSupport() async {}

  @override
  Future<void> navigatePersonalData() async {}

  @override
  Future<void> navigateNotifications() async {}

  // fz:navigate-methods
}
