import 'package:navigation_api/navigation_api.dart';

import '{{feature_name.snakeCase()}}.gr.dart';
export '{{feature_name.snakeCase()}}.gr.dart';
export 'src/di/configure_dependencies.module.dart';

@AutoRouterConfig(replaceInRouteName: 'Page|Screen|Popup|BottomSheet|Dialog|Drawer|Route')
class {{feature_name.pascalCase()}}Router extends RootStackRouter {
  @override
  List<AutoRoute> get routes => <AutoRoute>[
    // fz:feature-routes
  ];
}
