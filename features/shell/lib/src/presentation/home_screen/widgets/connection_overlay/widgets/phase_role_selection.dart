import 'package:core_ui/core_ui.dart';
import 'package:shell/src/presentation/home_screen/widgets/connection_overlay/widgets/circular_button.dart';

class PhaseRoleSelection extends StatelessWidget {
  final VoidCallback onHostTap;
  final VoidCallback onClientTap;

  const PhaseRoleSelection({super.key, required this.onHostTap, required this.onClientTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 100),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          CircularButton(icon: AppIcons.host, onTap: onHostTap),
          CircularButton(icon: AppIcons.discover, onTap: onClientTap),
        ],
      ),
    );
  }
}
