import 'package:core_ui/core_ui.dart';
import 'package:main/main/home_screen/widgets/home_app_bar/widgets/user_label.dart';

class UsersContainer extends StatelessWidget {
  final bool isConnected;
  final String? localUserName;
  final String? remoteUserName;

  const UsersContainer({
    super.key,
    required this.isConnected,
    required this.localUserName,
    required this.remoteUserName,
  });

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.colors;

    if (localUserName == null && remoteUserName == null) return const SizedBox.shrink();

    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: colors.background.accentOrange,
        borderRadius: BorderRadius.circular(UserLabel.radius + 4),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 2,
        children: <Widget>[
          if (localUserName != null) UserLabel(label: localUserName!),
          if (isConnected && remoteUserName != null)
            Icon(Icons.add, color: colors.icons.main, size: 24),
          if (isConnected && remoteUserName != null)
            UserLabel(label: remoteUserName!, isRemote: true),
        ],
      ),
    );
  }
}
