import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:main/main/home_screen/bloc/home_bloc.dart';
import 'package:main/main/home_screen/widgets/app_bar/app_bar.dart';
import 'package:main/main/home_screen/widgets/connection_overlay/connection_overlay.dart';
import 'package:main/main/home_screen/widgets/drawer/home_drawer.dart';
import 'package:main/main/home_screen/widgets/games_content/games_content.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({
    super.key,
    required this.isGamesEnabled,
    required this.isOverlayVisible,
    required this.overlay,
    required this.projection,
  });

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
          appBar: const HomeAppBar(),
          endDrawer: HomeDrawer(
            onEditProfileTap: () {
              Navigator.of(context).pop();
              homeBloc.add(const HomeEvent.profileMenuTapped());
            },
            onConnectTap: () {
              Navigator.of(context).pop();
              homeBloc.add(const HomeEvent.connectMenuTapped());
            },
            onDisconnectTap: () {
              Navigator.of(context).pop();
              homeBloc.add(const HomeEvent.disconnectMenuTapped());
            },
          ),
          body: GamesContent(isEnabled: isGamesEnabled),
        ),
        if (isOverlayVisible)
          Positioned.fill(
            child: ConnectionOverlay(
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
          ),
      ],
    );
  }
}
