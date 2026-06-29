import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';

class AppSeekingIndicator extends StatelessWidget {
  const AppSeekingIndicator({super.key});

  @override
  Widget build(BuildContext context) => appLocator<AppAnimations>().seeking();
}
