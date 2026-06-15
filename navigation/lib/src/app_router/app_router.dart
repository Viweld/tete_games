import 'package:core/core.dart';
import 'package:navigation/navigation.dart';

@AutoRouterConfig(replaceInRouteName: 'Page|Screen|Popup|BottomSheet|Dialog|Drawer,Route')
class AppRouter extends RootStackRouter {
  final AutoRouteObserver routeObserver = AutoRouteObserver();

  @override
  List<AutoRoute> get routes => <AutoRoute>[
    // fz:routes
    AutoRoute(page: HomeRoute.page),
    AutoRoute(page: SplashRoute.page, initial: true),
  ];

  Future<void> navigateBack([Object? result]) => maybePop(result);

  Future<void> navigateRoot() => replaceAll(<PageRouteInfo<Object?>>[const HomeRoute()]);

  // fz:navigate-methods
  Future<void> navigateHome() => push(const HomeRoute());

  /// Stubs for `core_ui` MainAppBar until modules are connected via `fz add`.
  Future<void> navigateSupport() async {}

  Future<void> navigatePersonalData() async {}

  Future<void> navigateNotifications() async {}
}
