import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';

class AppAdvertisingIndicator extends StatelessWidget {
  const AppAdvertisingIndicator({super.key});

  @override
  Widget build(BuildContext context) => appLocator<AppAnimations>().advertising();
}
