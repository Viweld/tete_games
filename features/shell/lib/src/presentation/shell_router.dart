import 'package:navigation_api/navigation_api.dart';

import 'shell_router.gr.dart';

/// Codegen anchor for route classes. App route tree lives in [AppRouter].
@AutoRouterConfig(replaceInRouteName: 'Page|Screen|Popup|BottomSheet|Dialog|Drawer,Route')
class ShellRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => <AutoRoute>[
    AutoRoute(page: HomeRoute.page),
    AutoRoute(page: SplashRoute.page),
  ];
}
