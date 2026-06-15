import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';
import 'package:main/main/home_screen/bloc/home_bloc.dart';
import 'package:main/main/home_screen/bloc/profile_bloc.dart';
import 'package:main/main/home_screen/home_content.dart';
import 'package:main/main/home_screen/widgets/nickname_dialog/nickname_dialog.dart';

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
      child: const _HomeScreenBody(),
    );
  }
}

class _HomeScreenBody extends StatelessWidget {
  const _HomeScreenBody();

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: <BlocListener<dynamic, dynamic>>[
        BlocListener<ProfileBloc, ProfileState>(
          listenWhen: (ProfileState previous, ProfileState current) =>
              previous.effect != current.effect,
          listener: _handleProfileEffect,
        ),
        BlocListener<HomeBloc, HomeState>(
          listenWhen: (HomeState previous, HomeState current) => previous.effect != current.effect,
          listener: _handleHomeEffect,
        ),
      ],
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (BuildContext context, HomeState homeState) {
          final PlayerProfile? profile = context.watch<ProfileBloc>().state.profile;
          return HomeContent(profile: profile, homeState: homeState);
        },
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

    final AppLocalization l10n = context.localization;
    final HomeBloc homeBloc = context.read<HomeBloc>();
    final ProfileBloc profileBloc = context.read<ProfileBloc>();

    await effect.when(
      showConnectionOverlay: () async {
        final bool opened = await _ensureProfileAndOpenOverlay(
          context,
          profileBloc: profileBloc,
          homeBloc: homeBloc,
          dialogContext: NicknameDialogContext.connect,
        );
        if (!opened) return;
      },
      closeConnectionOverlay: () {
        homeBloc.add(const HomeEvent.overlayClosed());
      },
      showProfileDialog: () => _showNicknameDialog(context, NicknameDialogContext.profileMenu),
      showToast: (PeerToastKind kind) {
        final String message = switch (kind) {
          PeerToastKind.invitationRejected => l10n.peer_client_invitation_rejected_body,
          PeerToastKind.bluetoothUnavailable => l10n.peer_error_bluetooth_unavailable,
          PeerToastKind.discoveryFailed => l10n.peer_client_error_discovery,
          PeerToastKind.connectionFailed => l10n.peer_client_error_connection,
          PeerToastKind.genericError => l10n.something_went_wrong,
        };
        context.showErrorToast(message);
      },
      requestNicknameForOverlayRole: () async {
        await _showNicknameDialog(context, NicknameDialogContext.overlayRole);
      },
    );

    if (context.mounted) {
      homeBloc.add(const HomeEvent.effectHandled());
    }
  }

  Future<bool> _ensureProfileAndOpenOverlay(
    BuildContext context, {
    required ProfileBloc profileBloc,
    required HomeBloc homeBloc,
    required NicknameDialogContext dialogContext,
  }) async {
    if (profileBloc.state.profile != null) {
      await _openOverlay(homeBloc);
      return true;
    }

    final bool? saved = await _showNicknameDialog(context, dialogContext);
    if (!context.mounted || saved != true) return false;

    profileBloc.add(const ProfileEvent.refreshRequested());
    await _openOverlay(homeBloc);
    return true;
  }

  Future<void> _openOverlay(HomeBloc homeBloc) async {
    homeBloc.add(const HomeEvent.overlayOpened());
    await appLocator<PeerConnectionService>().openRoleSelection(
      projection: homeBloc.state.projection,
    );
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
