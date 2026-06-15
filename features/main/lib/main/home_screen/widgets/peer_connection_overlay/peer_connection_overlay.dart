import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:main/main/home_screen/widgets/peer_device_list_item.dart';

class PeerConnectionOverlay extends StatelessWidget {
  const PeerConnectionOverlay({
    super.key,
    required this.overlay,
    required this.projection,
    required this.onClose,
    required this.onHostTap,
    required this.onClientTap,
    required this.onDeviceTap,
    required this.onInviteTap,
    required this.onAcceptTap,
    required this.onRejectTap,
  });

  final OverlayRenderViewState overlay;
  final FrameProjectionInput projection;
  final VoidCallback onClose;
  final VoidCallback onHostTap;
  final VoidCallback onClientTap;
  final ValueChanged<String?> onDeviceTap;
  final VoidCallback onInviteTap;
  final VoidCallback onAcceptTap;
  final VoidCallback onRejectTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.colors.background.main.withValues(alpha: 0.96),
      child: SafeArea(
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(onPressed: onClose, icon: const Icon(Icons.close)),
            ),
            Expanded(
              child: switch (overlay.phase) {
                OverlayPhase.roleSelection => _RoleSelectionBody(
                  onHostTap: onHostTap,
                  onClientTap: onClientTap,
                ),
                OverlayPhase.hostAdvertising => const _HostAdvertisingBody(),
                OverlayPhase.hostInvitationDecision => _HostInvitationBody(
                  overlay: overlay,
                  onAcceptTap: onAcceptTap,
                  onRejectTap: onRejectTap,
                ),
                OverlayPhase.clientDiscovering => _ClientDiscoveringBody(
                  overlay: overlay,
                  projection: projection,
                  onDeviceTap: onDeviceTap,
                  onInviteTap: onInviteTap,
                ),
                OverlayPhase.clientInviting => const _ClientInvitingBody(),
                OverlayPhase.clientInvitationRejected => const _ClientInvitingBody(),
                OverlayPhase.error => const _OverlayErrorBody(),
                OverlayPhase.hidden => const SizedBox.shrink(),
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _RoleSelectionBody extends StatelessWidget {
  const _RoleSelectionBody({required this.onHostTap, required this.onClientTap});

  final VoidCallback onHostTap;
  final VoidCallback onClientTap;

  @override
  Widget build(BuildContext context) {
    final AppLocalization localization = context.localization;
    final AppColorsTheme colors = context.colors;

    return Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            localization.peer_home_mode_prompt,
            style: AppFonts.b1.copyWith(color: colors.text.main),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 48),
          AppElevatedButton(
            title: localization.peer_home_start_server_button,
            prefix: const Icon(Icons.visibility),
            onTap: onHostTap,
          ),
          const SizedBox(height: 16),
          AppElevatedButton(
            title: localization.peer_home_start_client_button,
            style: AppElevatedButtonStyle.accent,
            prefix: const Icon(Icons.search),
            onTap: onClientTap,
          ),
        ],
      ),
    );
  }
}

class _HostAdvertisingBody extends StatelessWidget {
  const _HostAdvertisingBody();

  @override
  Widget build(BuildContext context) {
    final AppLocalization localization = context.localization;

    return _CenteredMessage(
      title: localization.peer_server_waiting_title,
      body: localization.peer_server_waiting_body,
    );
  }
}

class _HostInvitationBody extends StatelessWidget {
  const _HostInvitationBody({
    required this.overlay,
    required this.onAcceptTap,
    required this.onRejectTap,
  });

  final OverlayRenderViewState overlay;
  final VoidCallback onAcceptTap;
  final VoidCallback onRejectTap;

  @override
  Widget build(BuildContext context) {
    final AppLocalization localization = context.localization;
    final AppColorsTheme colors = context.colors;
    final PeerEndpoint? invitation = overlay.pendingInvitation;
    final String deviceName = invitation?.device.name ?? '';
    final String playerName = invitation?.identity.displayName ?? '';
    final TextStyle bodyStyle = AppFonts.b2.copyWith(color: colors.text.main);

    return Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            localization.peer_server_invitation_title,
            style: AppFonts.h3.copyWith(color: colors.text.main),
          ),
          const SizedBox(height: 16),
          Text(localization.peer_server_invitation_device(deviceName), style: bodyStyle),
          Text(localization.peer_server_invitation_player(playerName), style: bodyStyle),
          const SizedBox(height: 8),
          Text(localization.peer_server_invitation_prompt, style: bodyStyle),
          const SizedBox(height: 32),
          AppElevatedButton(title: localization.peer_server_accept_button, onTap: onAcceptTap),
          const SizedBox(height: 12),
          AppElevatedButton(
            title: localization.peer_server_reject_button,
            style: AppElevatedButtonStyle.accent,
            onTap: onRejectTap,
          ),
        ],
      ),
    );
  }
}

class _ClientDiscoveringBody extends StatelessWidget {
  const _ClientDiscoveringBody({
    required this.overlay,
    required this.projection,
    required this.onDeviceTap,
    required this.onInviteTap,
  });

  final OverlayRenderViewState overlay;
  final FrameProjectionInput projection;
  final ValueChanged<String?> onDeviceTap;
  final VoidCallback onInviteTap;

  @override
  Widget build(BuildContext context) {
    final AppLocalization localization = context.localization;
    final AppColorsTheme colors = context.colors;
    final bool hasSelection = projection.highlightedDeviceId != null;

    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            overlay.devices.isEmpty
                ? localization.peer_client_searching
                : localization.peer_client_devices_title,
            style: AppFonts.h6.copyWith(color: colors.text.main),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: overlay.devices.length,
            itemBuilder: (BuildContext context, int index) {
              final PeerDevice device = overlay.devices[index];
              return PeerDeviceListItem(
                device: device,
                isSelected: projection.highlightedDeviceId == device.id,
                onTap: () {
                  final String? nextId = projection.highlightedDeviceId == device.id
                      ? null
                      : device.id;
                  onDeviceTap(nextId);
                },
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: AppElevatedButton(
            title: localization.peer_client_invite_button,
            state: hasSelection ? ElementState.enabled : ElementState.disabled,
            onTap: onInviteTap,
          ),
        ),
      ],
    );
  }
}

class _ClientInvitingBody extends StatelessWidget {
  const _ClientInvitingBody();

  @override
  Widget build(BuildContext context) {
    final AppLocalization localization = context.localization;

    return _CenteredMessage(
      title: localization.peer_client_invitation_sent_title,
      body: localization.peer_client_wait_confirmation,
    );
  }
}

class _OverlayErrorBody extends StatelessWidget {
  const _OverlayErrorBody();

  @override
  Widget build(BuildContext context) {
    final AppLocalization localization = context.localization;

    return _CenteredMessage(
      title: localization.peer_server_invitation_title,
      body: localization.peer_client_searching,
    );
  }
}

class _CenteredMessage extends StatelessWidget {
  const _CenteredMessage({required this.title, required this.body});

  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.colors;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              title,
              style: AppFonts.h3.copyWith(color: colors.text.main),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              body,
              style: AppFonts.b2.copyWith(color: colors.text.main),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
