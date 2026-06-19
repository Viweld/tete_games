import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:main/main/home_screen/bloc/home_bloc.dart';
import 'package:main/main/home_screen/home_content.dart';
import 'package:main/main/home_screen/widgets/drawer/bloc/home_drawer_bloc.dart';
import 'package:main/main/home_screen/widgets/nickname_dialog/nickname_dialog.dart';
import 'package:main/main/home_screen/widgets/nickname_dialog/nickname_dialog_context.dart';
import 'package:navigation/navigation.dart';
import 'package:nested/nested.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: <SingleChildWidget>[
        BlocProvider<HomeBloc>(create: (_) => appLocator<HomeBloc>()),
        BlocProvider<HomeDrawerBloc>(create: (_) => appLocator<HomeDrawerBloc>()),
      ],
      child: BlocListener<HomeBloc, HomeState>(
        listenWhen: (HomeState previous, HomeState current) => previous.effect != current.effect,
        listener: _handleHomeEffect,
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (BuildContext context, HomeState homeState) {
            return HomeContent(
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

  Future<void> _handleHomeEffect(BuildContext context, HomeState state) async {
    final HomeEffect? effect = state.effect;
    if (effect == null) return;

    final AppLocalization localization = context.localization;
    final HomeBloc homeBloc = context.read<HomeBloc>();

    await effect.when(
      showNicknameDialog: (NicknameDialogContext dialogContext) async {
        final bool? saved = await _showNicknameDialog(context, dialogContext);
        if (!context.mounted) return;

        switch (dialogContext) {
          case NicknameDialogContext.firstLaunch:
          case NicknameDialogContext.profileMenu:
            return;
          case NicknameDialogContext.connect:
            if (saved == true) {
              homeBloc.add(const HomeEvent.overlayOpened());
            }
          case NicknameDialogContext.overlayRole:
            if (saved == true) {
              homeBloc.add(const HomeEvent.overlayRoleNicknameConfirmed());
            } else {
              homeBloc.add(const HomeEvent.overlayRoleNicknameCancelled());
            }
        }
      },
      closeConnectionOverlay: () {
        homeBloc.add(const HomeEvent.overlayClosed());
      },
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
      await appLocator<ProfileRepository>().setFirstLaunchCompleted();
    }

    return saved;
  }
}
