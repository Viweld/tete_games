import 'package:core_ui/core_ui.dart';
import 'package:main/main/home_screen/widgets/drawer/widgets/connection_section/connection_section.dart';
import 'package:main/main/home_screen/widgets/drawer/widgets/footer.dart';
import 'package:main/main/home_screen/widgets/drawer/widgets/profile_section/profile_section.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({
    super.key,
    required this.onEditProfileTap,
    required this.onConnectTap,
    required this.onDisconnectTap,
  });

  final VoidCallback onEditProfileTap;
  final VoidCallback onConnectTap;
  final VoidCallback onDisconnectTap;

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.colors;

    return Drawer(
      backgroundColor: colors.background.secondaryCard,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ProfileSection(onEditProfileTap: onEditProfileTap),
            const AppDivider(),
            ConnectionSection(onConnectTap: onConnectTap, onDisconnectTap: onDisconnectTap),
            const Spacer(),
            const AppDivider(),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
