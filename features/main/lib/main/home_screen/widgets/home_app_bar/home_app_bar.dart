import 'package:core_ui/core_ui.dart';
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
    required this.connectLabel,
    required this.disconnectLabel,
    required this.profileLabel,
    required this.title,
  });

  final bool isConnected;
  final String? localDisplayName;
  final String? remoteDisplayName;
  final VoidCallback onConnectTap;
  final VoidCallback onDisconnectTap;
  final VoidCallback onProfileTap;
  final String connectLabel;
  final String disconnectLabel;
  final String profileLabel;
  final String title;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.colors;
    final Color background = isConnected
        ? colors.background.successGreen
        : colors.background.secondaryCard;

    return AppBar(
      backgroundColor: background,
      title: Text(title),
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
                child: Text(connectLabel),
              ),
            if (isConnected)
              PopupMenuItem<_HomeMenuAction>(
                value: _HomeMenuAction.disconnect,
                child: Text(disconnectLabel),
              ),
            PopupMenuItem<_HomeMenuAction>(
              value: _HomeMenuAction.profile,
              child: Text(profileLabel),
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
      child: Text(initial, style: TextStyle(color: colors.text.white, fontSize: 14)),
    );
  }
}
