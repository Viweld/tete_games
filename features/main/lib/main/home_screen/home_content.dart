import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:main/main/home_screen/bloc/home_bloc.dart';
import 'package:main/main/home_screen/widgets/home_app_bar/home_app_bar.dart';
import 'package:main/main/home_screen/widgets/home_games_grid/home_games_grid.dart';
import 'package:main/main/home_screen/bloc/profile_bloc.dart';
import 'package:main/main/home_screen/widgets/nickname_dialog/nickname_dialog.dart';
import 'package:main/main/home_screen/widgets/peer_connection_overlay/peer_connection_overlay.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key, required this.profile, required this.homeState});

  final PlayerProfile? profile;
  final HomeState homeState;

  @override
  Widget build(BuildContext context) {
    final AppLocalization l10n = context.localization;
    final HomeBloc homeBloc = context.read<HomeBloc>();

    return Stack(
      children: <Widget>[
        AppScaffold(
          appBar: HomeAppBar(
            isConnected: homeState.isConnected,
            localDisplayName: profile?.displayName,
            remoteDisplayName: homeState.remoteDisplayName,
            title: l10n.peer_home_title,
            connectLabel: l10n.peer_home_menu_connect,
            disconnectLabel: l10n.peer_home_menu_disconnect,
            profileLabel: l10n.peer_home_menu_profile,
            onConnectTap: () => homeBloc.add(const HomeEvent.connectMenuTapped()),
            onDisconnectTap: () => homeBloc.add(const HomeEvent.disconnectMenuTapped()),
            onProfileTap: () => homeBloc.add(const HomeEvent.profileMenuTapped()),
          ),
          body: HomeGamesGrid(
            isEnabled: homeState.isGamesEnabled,
            emptyLabel: l10n.peer_games_list_stub,
          ),
        ),
        if (homeState.isOverlayVisible)
          PeerConnectionOverlay(
            overlay: homeState.overlay,
            projection: homeState.projection,
            onClose: () => homeBloc.add(const HomeEvent.overlayDismissTapped()),
            onHostTap: () => _onRoleSelected(context, homeBloc, const HomeEvent.hostTapped()),
            onClientTap: () => _onRoleSelected(context, homeBloc, const HomeEvent.clientTapped()),
            onDeviceTap: (String? deviceId) =>
                homeBloc.add(HomeEvent.deviceHighlightChanged(deviceId: deviceId)),
            onInviteTap: () => homeBloc.add(const HomeEvent.inviteDeviceTapped()),
            onAcceptTap: () => homeBloc.add(const HomeEvent.acceptInvitationTapped()),
            onRejectTap: () => homeBloc.add(const HomeEvent.rejectInvitationTapped()),
            l10nHostButton: l10n.peer_home_start_server_button,
            l10nClientButton: l10n.peer_home_start_client_button,
            l10nModePrompt: l10n.peer_home_mode_prompt,
            l10nServerWaitingTitle: l10n.peer_server_waiting_title,
            l10nServerWaitingBody: l10n.peer_server_waiting_body,
            l10nInvitationTitle: l10n.peer_server_invitation_title,
            l10nInvitationPrompt: l10n.peer_server_invitation_prompt,
            l10nInvitationDevice: l10n.peer_server_invitation_device,
            l10nInvitationPlayer: l10n.peer_server_invitation_player,
            l10nAcceptButton: l10n.peer_server_accept_button,
            l10nRejectButton: l10n.peer_server_reject_button,
            l10nClientSearching: l10n.peer_client_searching,
            l10nClientDevicesTitle: l10n.peer_client_devices_title,
            l10nInviteButton: l10n.peer_client_invite_button,
            l10nInvitationSentTitle: l10n.peer_client_invitation_sent_title,
            l10nWaitConfirmation: l10n.peer_client_wait_confirmation,
            l10nUnknownDevice: l10n.peer_client_unknown_device,
            l10nOurAppBadge: l10n.peer_client_our_app_badge,
            l10nCancel: l10n.peer_dialog_cancel,
          ),
      ],
    );
  }

  Future<void> _onRoleSelected(BuildContext context, HomeBloc homeBloc, HomeEvent event) async {
    final ProfileBloc profileBloc = context.read<ProfileBloc>();
    if (profileBloc.state.profile == null) {
      final bool? saved = await NicknameDialog.show(context);
      if (!context.mounted || saved != true) return;
      profileBloc.add(const ProfileEvent.refreshRequested());
    }

    if (!context.mounted) return;
    homeBloc.add(event);
  }
}
