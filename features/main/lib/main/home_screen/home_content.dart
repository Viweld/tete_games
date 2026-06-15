import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:main/main/home_screen/bloc/home_bloc.dart';
import 'package:main/main/home_screen/bloc/profile_bloc.dart';
import 'package:main/main/home_screen/widgets/home_app_bar/home_app_bar.dart';
import 'package:main/main/home_screen/widgets/home_games_grid/home_games_grid.dart';
import 'package:main/main/home_screen/widgets/nickname_dialog/nickname_dialog.dart';
import 'package:main/main/home_screen/widgets/peer_connection_overlay/peer_connection_overlay.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key, required this.profile, required this.homeState});

  final PlayerProfile? profile;
  final HomeState homeState;

  @override
  Widget build(BuildContext context) {
    final HomeBloc homeBloc = context.read<HomeBloc>();

    return Stack(
      children: <Widget>[
        AppScaffold(
          appBar: HomeAppBar(
            isConnected: homeState.isConnected,
            localDisplayName: profile?.displayName,
            remoteDisplayName: homeState.remoteDisplayName,
            onConnectTap: () => homeBloc.add(const HomeEvent.connectMenuTapped()),
            onDisconnectTap: () => homeBloc.add(const HomeEvent.disconnectMenuTapped()),
            onProfileTap: () => homeBloc.add(const HomeEvent.profileMenuTapped()),
          ),
          body: HomeGamesGrid(isEnabled: homeState.isGamesEnabled),
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
