import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:main/main/home_screen/bloc/home_bloc.dart';
import 'package:main/main/home_screen/bloc/profile_bloc.dart';
import 'package:main/main/home_screen/home_content.dart';
import 'package:main/main/home_screen/widgets/nickname_dialog/nickname_dialog.dart';
import 'package:navigation/navigation.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: <BlocProvider<dynamic>>[
        BlocProvider<HomeBloc>(create: (_) => appLocator<HomeBloc>()),
        BlocProvider<ProfileBloc>(create: (_) => appLocator<ProfileBloc>()),
      ],
      child: MultiBlocListener(
        listeners: <BlocListener<dynamic, dynamic>>[
          BlocListener<ProfileBloc, ProfileState>(
            listenWhen: (ProfileState previous, ProfileState current) =>
                previous.effect != current.effect,
            listener: _handleProfileEffect,
          ),
          BlocListener<HomeBloc, HomeState>(
            listenWhen: (HomeState previous, HomeState current) =>
                previous.effect != current.effect,
            listener: _handleHomeEffect,
          ),
        ],
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (BuildContext context, HomeState homeState) {
            final PlayerProfile? profile = context.watch<ProfileBloc>().state.profile;
            return HomeContent(
              profile: profile,
              isConnected: homeState.isConnected,
              remoteDisplayName: homeState.remoteDisplayName,
              isGamesEnabled: homeState.isGamesEnabled,
              isOverlayVisible: homeState.isOverlayVisible,
              overlay: homeState.overlay,
              projection: homeState.projection,
            );
          },
        ),
      ),
    );
  }

  Future<void> _handleProfileEffect(BuildContext context, ProfileState state) async {
    final ProfileEffect? effect = state.effect;
    if (effect == null) return;

    await effect.when(
      showNicknameDialog: (NicknameDialogContext dialogContext) async {
        await _showNicknameDialog(context, dialogContext);
      },
    );

    if (context.mounted) {
      context.read<ProfileBloc>().add(const ProfileEvent.effectHandled());
    }
  }

  Future<void> _handleHomeEffect(BuildContext context, HomeState state) async {
    final HomeEffect? effect = state.effect;
    if (effect == null) return;

    final AppLocalization localization = context.localization;
    final HomeBloc homeBloc = context.read<HomeBloc>();
    final ProfileBloc profileBloc = context.read<ProfileBloc>();

    await effect.when(
      showConnectionOverlay: () async {
        final bool? saved = await _showNicknameDialog(context, NicknameDialogContext.connect);
        if (!context.mounted || saved != true) return;

        profileBloc.add(const ProfileEvent.refreshRequested());
        homeBloc.add(const HomeEvent.overlayOpened());
      },
      closeConnectionOverlay: () {
        homeBloc.add(const HomeEvent.overlayClosed());
      },
      showProfileDialog: () => _showNicknameDialog(context, NicknameDialogContext.profileMenu),
      showToast: (PeerToastKind kind) {
        final String message = switch (kind) {
          PeerToastKind.invitationRejected => localization.peer_client_invitation_rejected_body,
          PeerToastKind.bluetoothUnavailable => localization.peer_error_bluetooth_unavailable,
          PeerToastKind.discoveryFailed => localization.peer_client_error_discovery,
          PeerToastKind.connectionFailed => localization.peer_client_error_connection,
          PeerToastKind.peerDisconnected => localization.peer_disconnect_peer_left,
          PeerToastKind.linkLost => localization.peer_disconnect_link_lost,
          PeerToastKind.timeout => localization.peer_disconnect_timeout,
          PeerToastKind.genericError => localization.something_went_wrong,
        };
        context.showErrorToast(message);
      },
      requestNicknameForOverlayRole: () async {
        final bool? saved = await _showNicknameDialog(context, NicknameDialogContext.overlayRole);
        if (!context.mounted) return;

        if (saved != true) {
          homeBloc.add(const HomeEvent.overlayRoleNicknameCancelled());
          return;
        }

        profileBloc.add(const ProfileEvent.refreshRequested());
        homeBloc.add(const HomeEvent.overlayRoleNicknameConfirmed());
      },
    );

    if (context.mounted) {
      homeBloc.add(const HomeEvent.effectHandled());
    }
  }

  Future<bool?> _showNicknameDialog(
    BuildContext context,
    NicknameDialogContext dialogContext,
  ) async {
    final bool? saved = await NicknameDialog.show(context);
    if (!context.mounted) return saved;

    if (saved != true && dialogContext == NicknameDialogContext.firstLaunch) {
      await appLocator<IPlayerProfileRepository>().setFirstLaunchCompleted();
    }

    if (saved == true && context.mounted) {
      context.read<ProfileBloc>().add(const ProfileEvent.refreshRequested());
    }

    return saved;
  }
}
