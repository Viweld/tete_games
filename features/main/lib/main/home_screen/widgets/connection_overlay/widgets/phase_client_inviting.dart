import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:main/main/home_screen/widgets/connection_overlay/widgets/centered_message.dart';
import 'package:main/main/home_screen/widgets/connection_overlay/widgets/circular_button.dart';
import 'package:main/main/home_screen/widgets/connection_overlay/widgets/peer_card.dart';

class PhaseClientInviting extends StatelessWidget {
  final List<PeerDevice> devices;
  final String? invitedDeviceId;
  final bool isRejected;

  const PhaseClientInviting({
    super.key,
    required this.devices,
    required this.invitedDeviceId,
    this.isRejected = false,
  });

  @override
  Widget build(BuildContext context) {
    final AppLocalization localization = context.localization;

    if (devices.isEmpty || invitedDeviceId == null) {
      if (isRejected) {
        return CenteredMessage.error(
          title: localization.peer_client_invitation_rejected_title,
          body: localization.peer_client_invitation_rejected_body,
        );
      }

      return CenteredMessage.discovering(
        title: localization.peer_client_invitation_sent_title,
        body: localization.peer_client_wait_confirmation,
      );
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          for (int index = 0; index < devices.length; index++) ...<Widget>[
            if (index > 0) const SizedBox(height: 10),
            _PhaseClientInvitingDeviceCard(
              device: devices[index],
              invitedDeviceId: invitedDeviceId!,
              isRejected: isRejected,
            ),
            const SizedBox(height: CircularButton.size + 24),
          ],
        ],
      ),
    );
  }
}

class _PhaseClientInvitingDeviceCard extends StatelessWidget {
  final PeerDevice device;
  final String invitedDeviceId;
  final bool isRejected;

  const _PhaseClientInvitingDeviceCard({
    required this.device,
    required this.invitedDeviceId,
    required this.isRejected,
  });

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

    return PeerCard(
      title: title,
      subtitle: subtitle,
      visualState: isInvited ? PeerCardVisualState.waiting : PeerCardVisualState.faded,
      reserveTrailingSpace: true,
      showsTrailingLoader: isInvited && !isRejected,
    );
  }
}
