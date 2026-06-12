import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:main/main/home_screen/widgets/server_session_dialog/bloc/server_session_bloc.dart';

class ServerSessionDialog extends StatelessWidget {
  const ServerSessionDialog._();

  static const double _widthFraction = 0.9;
  static const double _heightFraction = 0.4;

  static Future<void> show(BuildContext context) {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (_) => const ServerSessionDialog._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ServerSessionBloc>(
      create: (_) => appLocator<ServerSessionBloc>(),
      child: const _ServerSessionDialogBody(),
    );
  }
}

class _ServerSessionDialogBody extends StatelessWidget {
  const _ServerSessionDialogBody();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ServerSessionBloc, ServerSessionState>(
      listenWhen: (ServerSessionState previous, ServerSessionState current) =>
          previous.effect != current.effect,
      listener: (BuildContext context, ServerSessionState state) {
        final ServerSessionEffect? effect = state.effect;
        if (effect == null) return;

        effect.when(closeDialog: () => Navigator.of(context).pop());

        context.read<ServerSessionBloc>().add(const ServerSessionEvent.effectHandled());
      },
      builder: (BuildContext context, ServerSessionState state) {
        return switch (state.phase) {
          ServerSessionPhase.invitationPending => _ServerSessionInvitationPending(
            onCancelTapped: () => Navigator.of(context).pop(),
          ),
          ServerSessionPhase.userDecision => _ServerSessionUserDecision(
            remoteEndpoint: state.remoteEndpoint!,
            onAcceptTapped: () =>
                context.read<ServerSessionBloc>().add(const ServerSessionEvent.acceptTapped()),
            onRejectTapped: () =>
                context.read<ServerSessionBloc>().add(const ServerSessionEvent.rejectTapped()),
          ),
          ServerSessionPhase.error => _ServerSessionError(
            errorKind: state.errorKind,
            onCancelTapped: () => Navigator.of(context).pop(),
          ),
        };
      },
    );
  }
}

class _ServerSessionInvitationPending extends StatelessWidget {
  const _ServerSessionInvitationPending({required this.onCancelTapped});

  final VoidCallback onCancelTapped;

  @override
  Widget build(BuildContext context) {
    final AppLocalization l10n = context.localization;
    final Size screenSize = MediaQuery.sizeOf(context);

    return AlertDialog(
      title: Text(l10n.peer_server_waiting_title, textAlign: TextAlign.center),
      content: SizedBox(
        width: screenSize.width * ServerSessionDialog._widthFraction,
        height: screenSize.height * ServerSessionDialog._heightFraction,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const AppCircularLoadingIndicator(),
            const SizedBox(height: 16),
            Text(l10n.peer_server_waiting_body, textAlign: TextAlign.center),
          ],
        ),
      ),
      actions: <Widget>[AppElevatedButton(title: l10n.peer_dialog_cancel, onTap: onCancelTapped)],
    );
  }
}

class _ServerSessionUserDecision extends StatelessWidget {
  const _ServerSessionUserDecision({
    required this.remoteEndpoint,
    required this.onAcceptTapped,
    required this.onRejectTapped,
  });

  final PeerEndpoint remoteEndpoint;
  final VoidCallback onAcceptTapped;
  final VoidCallback onRejectTapped;

  @override
  Widget build(BuildContext context) {
    final AppLocalization l10n = context.localization;
    final Size screenSize = MediaQuery.sizeOf(context);

    return AlertDialog(
      title: Text(l10n.peer_server_invitation_title, textAlign: TextAlign.center),
      content: SizedBox(
        width: screenSize.width * ServerSessionDialog._widthFraction,
        height: screenSize.height * ServerSessionDialog._heightFraction,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              l10n.peer_server_invitation_device(remoteEndpoint.device.name),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              l10n.peer_server_invitation_player(remoteEndpoint.identity.displayName),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(l10n.peer_server_invitation_prompt, textAlign: TextAlign.center),
          ],
        ),
      ),
      actions: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: AppElevatedButton(
                title: l10n.peer_server_reject_button,
                onTap: onRejectTapped,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: AppElevatedButton(
                title: l10n.peer_server_accept_button,
                onTap: onAcceptTapped,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _ServerSessionError extends StatelessWidget {
  const _ServerSessionError({required this.errorKind, required this.onCancelTapped});

  final ServerSessionErrorKind? errorKind;
  final VoidCallback onCancelTapped;

  @override
  Widget build(BuildContext context) {
    final AppLocalization l10n = context.localization;
    final Size screenSize = MediaQuery.sizeOf(context);
    final String message = switch (errorKind) {
      ServerSessionErrorKind.bluetoothUnavailable => l10n.peer_error_bluetooth_unavailable,
      ServerSessionErrorKind.unknown || null => l10n.something_went_wrong,
    };

    return AlertDialog(
      title: Text(l10n.peer_dialog_error_title, textAlign: TextAlign.center),
      content: SizedBox(
        width: screenSize.width * ServerSessionDialog._widthFraction,
        height: screenSize.height * ServerSessionDialog._heightFraction,
        child: Center(child: Text(message, textAlign: TextAlign.center)),
      ),
      actions: <Widget>[AppElevatedButton(title: l10n.peer_dialog_cancel, onTap: onCancelTapped)],
    );
  }
}
