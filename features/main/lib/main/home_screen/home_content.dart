import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:main/main/home_screen/bloc/home_bloc.dart';
import 'package:main/main/home_screen/widgets/app_bar/app_bar.dart';
import 'package:main/main/home_screen/widgets/connection_overlay/connection_overlay.dart';
import 'package:main/main/home_screen/widgets/drawer/home_drawer.dart';
import 'package:main/main/home_screen/widgets/games_content/games_content.dart';

class HomeContent extends StatelessWidget {
  final bool isGamesEnabled;
  final bool isOverlayVisible;
  final OverlayRenderViewState overlay;
  final FrameProjectionInput projection;

  const HomeContent({
    super.key,
    required this.isGamesEnabled,
    required this.isOverlayVisible,
    required this.overlay,
    required this.projection,
  });

  @override
  Widget build(BuildContext context) {
    final HomeBloc bloc = context.read<HomeBloc>();

    return Stack(
      children: <Widget>[
        AppScaffold(
          appBar: const HomeAppBar(),
          endDrawer: HomeDrawer(
            onEditProfileTap: () => bloc.add(const HomeEvent.profileMenuTapped()),
            onConnectTap: () {
              Navigator.of(context).pop();
              bloc.add(const HomeEvent.connectMenuTapped());
            },
            onDisconnectTap: () {
              Navigator.of(context).pop();
              bloc.add(const HomeEvent.disconnectMenuTapped());
            },
          ),
          body: GamesContent(isEnabled: isGamesEnabled),
        ),
        if (isOverlayVisible)
          Positioned.fill(
            child: ConnectionOverlay(
              overlay: overlay,
              projection: projection,
              onClose: () => bloc.add(const HomeEvent.overlayDismissTapped()),
              onHostTap: () => bloc.add(const HomeEvent.hostTapped()),
              onClientTap: () => bloc.add(const HomeEvent.clientTapped()),
              onDeviceTap: (String? id) => bloc.add(HomeEvent.deviceHighlightChanged(id)),
              onInviteTap: () => bloc.add(const HomeEvent.inviteDeviceTapped()),
              onAcceptTap: () => bloc.add(const HomeEvent.acceptInvitationTapped()),
              onRejectTap: () => bloc.add(const HomeEvent.rejectInvitationTapped()),
            ),
          ),
      ],
    );
  }
}
