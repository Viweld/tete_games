import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    super.key,
    required this.isConnected,
    required this.localDisplayName,
    required this.remoteDisplayName,
    required this.onConnectTap,
    required this.onDisconnectTap,
    required this.onProfileTap,
  });

  final bool isConnected;
  final String? localDisplayName;
  final String? remoteDisplayName;
  final VoidCallback onConnectTap;
  final VoidCallback onDisconnectTap;
  final VoidCallback onProfileTap;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final AppLocalization localization = context.localization;
    final AppColorsTheme colors = context.colors;
    final Color background = isConnected
        ? colors.background.successGreen
        : colors.background.secondaryCard;

    return AppBar(
      backgroundColor: background,
      title: Text(
        localization.peer_home_title,
        style: AppFonts.h5.copyWith(color: colors.text.main),
      ),
      centerTitle: true,
      actions: <Widget>[
        if (localDisplayName != null)
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: _AvatarChip(label: localDisplayName!),
          ),
        if (isConnected && remoteDisplayName != null)
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: _AvatarChip(label: remoteDisplayName!, isRemote: true),
          ),
        PopupMenuButton<_HomeMenuAction>(
          onSelected: (_HomeMenuAction action) {
            switch (action) {
              case _HomeMenuAction.connect:
                onConnectTap();
              case _HomeMenuAction.disconnect:
                onDisconnectTap();
              case _HomeMenuAction.profile:
                onProfileTap();
            }
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<_HomeMenuAction>>[
            if (!isConnected)
              PopupMenuItem<_HomeMenuAction>(
                value: _HomeMenuAction.connect,
                child: Text(
                  localization.peer_home_menu_connect,
                  style: AppFonts.b2.copyWith(color: colors.text.main),
                ),
              ),
            if (isConnected)
              PopupMenuItem<_HomeMenuAction>(
                value: _HomeMenuAction.disconnect,
                child: Text(
                  localization.peer_home_menu_disconnect,
                  style: AppFonts.b2.copyWith(color: colors.text.main),
                ),
              ),
            PopupMenuItem<_HomeMenuAction>(
              value: _HomeMenuAction.profile,
              child: Text(
                localization.peer_home_menu_profile,
                style: AppFonts.b2.copyWith(color: colors.text.main),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

enum _HomeMenuAction { connect, disconnect, profile }

class _AvatarChip extends StatelessWidget {
  const _AvatarChip({required this.label, this.isRemote = false});

  final String label;
  final bool isRemote;

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.colors;
    final String initial = label.isNotEmpty ? label.characters.first.toUpperCase() : '?';

    return CircleAvatar(
      radius: 16,
      backgroundColor: isRemote ? colors.text.accent : colors.text.main,
      child: Text(initial, style: AppFonts.b4.copyWith(color: colors.text.white)),
    );
  }
}
