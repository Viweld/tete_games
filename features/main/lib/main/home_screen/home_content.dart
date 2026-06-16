import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:main/main/home_screen/bloc/home_bloc.dart';
import 'package:main/main/home_screen/widgets/home_app_bar/home_app_bar.dart';
import 'package:main/main/home_screen/widgets/home_games_grid/home_games_grid.dart';
import 'package:main/main/home_screen/widgets/peer_connection_overlay/peer_connection_overlay.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({
    super.key,
    required this.profile,
    required this.isConnected,
    required this.remoteDisplayName,
    required this.isGamesEnabled,
    required this.isOverlayVisible,
    required this.overlay,
    required this.projection,
  });

  final PlayerProfile? profile;
  final bool isConnected;
  final String? remoteDisplayName;
  final bool isGamesEnabled;
  final bool isOverlayVisible;
  final OverlayRenderViewState overlay;
  final FrameProjectionInput projection;

  @override
  Widget build(BuildContext context) {
    final HomeBloc homeBloc = context.read<HomeBloc>();

    return Stack(
      children: <Widget>[
        AppScaffold(
          appBar: HomeAppBar(
            isConnected: isConnected,
            localDisplayName: profile?.displayName,
            remoteDisplayName: remoteDisplayName,
            onConnectTap: () => homeBloc.add(const HomeEvent.connectMenuTapped()),
            onDisconnectTap: () => homeBloc.add(const HomeEvent.disconnectMenuTapped()),
            onProfileTap: () => homeBloc.add(const HomeEvent.profileMenuTapped()),
          ),
          body: HomeGamesGrid(isEnabled: isGamesEnabled),
        ),
        if (isOverlayVisible)
          PeerConnectionOverlay(
            overlay: overlay,
            projection: projection,
            onClose: () => homeBloc.add(const HomeEvent.overlayDismissTapped()),
            onHostTap: () => homeBloc.add(const HomeEvent.hostTapped()),
            onClientTap: () => homeBloc.add(const HomeEvent.clientTapped()),
            onDeviceTap: (String? deviceId) =>
                homeBloc.add(HomeEvent.deviceHighlightChanged(deviceId: deviceId)),
            onInviteTap: () => homeBloc.add(const HomeEvent.inviteDeviceTapped()),
            onAcceptTap: () => homeBloc.add(const HomeEvent.acceptInvitationTapped()),
            onRejectTap: () => homeBloc.add(const HomeEvent.rejectInvitationTapped()),
          ),
      ],
    );
  }
}
