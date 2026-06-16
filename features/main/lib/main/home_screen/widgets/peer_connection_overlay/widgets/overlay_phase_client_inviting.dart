import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:main/main/home_screen/widgets/peer_connection_overlay/widgets/peer_connection_overlay_centered_message.dart';
import 'package:main/main/home_screen/widgets/peer_connection_overlay/widgets/peer_connection_peer_card.dart';

class OverlayPhaseClientInviting extends StatelessWidget {
  const OverlayPhaseClientInviting({
    super.key,
    required this.devices,
    required this.invitedDeviceId,
    this.isRejected = false,
  });

  final List<PeerDevice> devices;
  final String? invitedDeviceId;
  final bool isRejected;

  @override
  Widget build(BuildContext context) {
    final AppLocalization localization = context.localization;

    if (devices.isEmpty || invitedDeviceId == null) {
      return PeerConnectionOverlayCenteredMessage(
        title: isRejected
            ? localization.peer_client_invitation_rejected_title
            : localization.peer_client_invitation_sent_title,
        body: isRejected
            ? localization.peer_client_invitation_rejected_body
            : localization.peer_client_wait_confirmation,
        showsLoadingIndicator: !isRejected,
      );
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          for (int index = 0; index < devices.length; index++) ...<Widget>[
            if (index > 0) const SizedBox(height: 10),
            _OverlayPhaseClientInvitingDeviceCard(
              device: devices[index],
              invitedDeviceId: invitedDeviceId!,
              isRejected: isRejected,
            ),
          ],
        ],
      ),
    );
  }
}

class _OverlayPhaseClientInvitingDeviceCard extends StatelessWidget {
  const _OverlayPhaseClientInvitingDeviceCard({
    required this.device,
    required this.invitedDeviceId,
    required this.isRejected,
  });

  final PeerDevice device;
  final String invitedDeviceId;
  final bool isRejected;

  @override
  Widget build(BuildContext context) {
    final AppLocalization localization = context.localization;
    final bool isInvited = device.id == invitedDeviceId;
    final String title = device.name.isEmpty
        ? localization.peer_client_unknown_device
        : device.name;
    final String subtitle = isInvited && isRejected
        ? localization.peer_client_invitation_rejected_body
        : isInvited
        ? localization.peer_peer_card_request_sent
        : localization.peer_peer_card_waiting_invitation;

    return PeerConnectionPeerCard(
      title: title,
      subtitle: subtitle,
      visualState: isInvited
          ? PeerConnectionPeerCardVisualState.waiting
          : PeerConnectionPeerCardVisualState.faded,
      showsTrailingLoader: isInvited && !isRejected,
    );
  }
}
