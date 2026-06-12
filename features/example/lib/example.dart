import 'package:navigation/navigation.dart';

export 'example.gr.dart';
export 'src/di/configure_dependencies.module.dart';

@AutoRouterConfig(replaceInRouteName: 'Page|Screen|Popup|BottomSheet|Dialog|Drawer,Route')
class ExampleRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => <AutoRoute>[AutoRoute(page: ExampleRoute.page)];
}
