import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';

class AppDiscoveringIndicator extends StatelessWidget {
  const AppDiscoveringIndicator({super.key});

  @override
  Widget build(BuildContext context) => appLocator<AppAnimations>().discovering();
}
