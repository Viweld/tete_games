import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:main/main/home_screen/widgets/client_session_dialog/bloc/client_session_bloc.dart';
import 'package:main/main/home_screen/widgets/peer_device_list_item.dart';

class ClientSessionDialog extends StatelessWidget {
  const ClientSessionDialog._();

  static const double _widthFraction = 0.9;
  static const double _heightFraction = 0.4;

  static Future<void> show(BuildContext context) {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (_) => const ClientSessionDialog._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ClientSessionBloc>(
      create: (_) => appLocator<ClientSessionBloc>(),
      child: const _ClientSessionDialogBody(),
    );
  }
}

class _ClientSessionDialogBody extends StatelessWidget {
  const _ClientSessionDialogBody();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ClientSessionBloc, ClientSessionState>(
      listenWhen: (ClientSessionState previous, ClientSessionState current) =>
          previous.effect != current.effect,
      listener: (BuildContext context, ClientSessionState state) {
        final ClientSessionEffect? effect = state.effect;
        if (effect == null) return;

        effect.when(closeDialog: () => Navigator.of(context).pop());

        context.read<ClientSessionBloc>().add(const ClientSessionEvent.effectHandled());
      },
      builder: (BuildContext context, ClientSessionState state) {
        return switch (state.phase) {
          ClientSessionPhase.initializing => _ClientSessionInitializing(
            onCancelTapped: () => Navigator.of(context).pop(),
          ),
          ClientSessionPhase.browsing => _ClientSessionBrowsing(
            devices: state.devices,
            selectedDevice: state.selectedDevice,
            onDeviceSelected: (PeerDevice device) => context.read<ClientSessionBloc>().add(
              ClientSessionEvent.deviceSelected(device: device),
            ),
            onConnectTapped: () =>
                context.read<ClientSessionBloc>().add(const ClientSessionEvent.connectTapped()),
            onCancelTapped: () => Navigator.of(context).pop(),
          ),
          ClientSessionPhase.remoteConfirmationPending => _ClientSessionRemoteConfirmationPending(
            onCancelTapped: () => Navigator.of(context).pop(),
          ),
          ClientSessionPhase.invitationRejected => _ClientSessionInvitationRejected(
            onCloseTapped: () => Navigator.of(context).pop(),
          ),
          ClientSessionPhase.error => _ClientSessionError(
            errorKind: state.errorKind,
            onCancelTapped: () => Navigator.of(context).pop(),
          ),
        };
      },
    );
  }
}

class _ClientSessionInitializing extends StatelessWidget {
  const _ClientSessionInitializing({required this.onCancelTapped});

  final VoidCallback onCancelTapped;

  @override
  Widget build(BuildContext context) {
    final AppLocalization l10n = context.localization;
    final Size screenSize = MediaQuery.sizeOf(context);

    return AlertDialog(
      title: Text(l10n.peer_client_devices_title, textAlign: TextAlign.center),
      content: SizedBox(
        width: screenSize.width * ClientSessionDialog._widthFraction,
        height: screenSize.height * ClientSessionDialog._heightFraction,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const AppCircularLoadingIndicator(),
            const SizedBox(height: 16),
            Text(l10n.peer_client_loading, textAlign: TextAlign.center),
          ],
        ),
      ),
      actions: <Widget>[AppElevatedButton(title: l10n.peer_dialog_cancel, onTap: onCancelTapped)],
    );
  }
}

class _ClientSessionBrowsing extends StatelessWidget {
  const _ClientSessionBrowsing({
    required this.devices,
    required this.selectedDevice,
    required this.onDeviceSelected,
    required this.onConnectTapped,
    required this.onCancelTapped,
  });

  final List<PeerDevice> devices;
  final PeerDevice? selectedDevice;
  final ValueChanged<PeerDevice> onDeviceSelected;
  final VoidCallback onConnectTapped;
  final VoidCallback onCancelTapped;

  @override
  Widget build(BuildContext context) {
    final AppLocalization l10n = context.localization;
    final Size screenSize = MediaQuery.sizeOf(context);

    return AlertDialog(
      title: Text(l10n.peer_client_waiting_hosts_title, textAlign: TextAlign.center),
      content: SizedBox(
        width: screenSize.width * ClientSessionDialog._widthFraction,
        height: screenSize.height * ClientSessionDialog._heightFraction,
        child: devices.isEmpty
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const AppCircularLoadingIndicator(),
                  const SizedBox(height: 16),
                  Text(l10n.peer_client_searching, textAlign: TextAlign.center),
                ],
              )
            : ListView.builder(
                itemCount: devices.length,
                itemBuilder: (BuildContext context, int index) {
                  final PeerDevice device = devices[index];
                  return PeerDeviceListItem(
                    device: device,
                    isSelected: selectedDevice?.id == device.id,
                    onTap: () => onDeviceSelected(device),
                    unknownDeviceLabel: l10n.peer_client_unknown_device,
                    ourAppSubtitle: l10n.peer_client_our_app_badge,
                  );
                },
              ),
      ),
      actions: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: AppElevatedButton(title: l10n.peer_dialog_cancel, onTap: onCancelTapped),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: AppElevatedButton(
                title: l10n.peer_client_invite_button,
                state: selectedDevice == null ? ElementState.disabled : ElementState.enabled,
                onTap: onConnectTapped,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _ClientSessionRemoteConfirmationPending extends StatelessWidget {
  const _ClientSessionRemoteConfirmationPending({required this.onCancelTapped});

  final VoidCallback onCancelTapped;

  @override
  Widget build(BuildContext context) {
    final AppLocalization l10n = context.localization;
    final Size screenSize = MediaQuery.sizeOf(context);

    return AlertDialog(
      title: Text(l10n.peer_client_invitation_sent_title, textAlign: TextAlign.center),
      content: SizedBox(
        width: screenSize.width * ClientSessionDialog._widthFraction,
        height: screenSize.height * ClientSessionDialog._heightFraction,
        child: Center(child: Text(l10n.peer_client_wait_confirmation, textAlign: TextAlign.center)),
      ),
      actions: <Widget>[AppElevatedButton(title: l10n.peer_dialog_cancel, onTap: onCancelTapped)],
    );
  }
}

class _ClientSessionInvitationRejected extends StatelessWidget {
  const _ClientSessionInvitationRejected({required this.onCloseTapped});

  final VoidCallback onCloseTapped;

  @override
  Widget build(BuildContext context) {
    final AppLocalization l10n = context.localization;
    final Size screenSize = MediaQuery.sizeOf(context);

    return AlertDialog(
      title: Text(l10n.peer_client_invitation_rejected_title, textAlign: TextAlign.center),
      content: SizedBox(
        width: screenSize.width * ClientSessionDialog._widthFraction,
        height: screenSize.height * ClientSessionDialog._heightFraction,
        child: Center(
          child: Text(l10n.peer_client_invitation_rejected_body, textAlign: TextAlign.center),
        ),
      ),
      actions: <Widget>[
        AppElevatedButton(title: l10n.peer_client_invitation_rejected_button, onTap: onCloseTapped),
      ],
    );
  }
}

class _ClientSessionError extends StatelessWidget {
  const _ClientSessionError({required this.errorKind, required this.onCancelTapped});

  final ClientSessionErrorKind? errorKind;
  final VoidCallback onCancelTapped;

  @override
  Widget build(BuildContext context) {
    final AppLocalization l10n = context.localization;
    final Size screenSize = MediaQuery.sizeOf(context);
    final String message = switch (errorKind) {
      ClientSessionErrorKind.discoveryFailed => l10n.peer_client_error_discovery,
      ClientSessionErrorKind.connectionFailed => l10n.peer_client_error_connection,
      null => l10n.something_went_wrong,
    };

    return AlertDialog(
      title: Text(l10n.peer_dialog_error_title, textAlign: TextAlign.center),
      content: SizedBox(
        width: screenSize.width * ClientSessionDialog._widthFraction,
        height: screenSize.height * ClientSessionDialog._heightFraction,
        child: Center(child: Text(message, textAlign: TextAlign.center)),
      ),
      actions: <Widget>[AppElevatedButton(title: l10n.peer_dialog_cancel, onTap: onCancelTapped)],
    );
  }
}
