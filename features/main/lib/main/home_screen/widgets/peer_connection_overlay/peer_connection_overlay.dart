import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
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
    required this.l10nHostButton,
    required this.l10nClientButton,
    required this.l10nModePrompt,
    required this.l10nServerWaitingTitle,
    required this.l10nServerWaitingBody,
    required this.l10nInvitationTitle,
    required this.l10nInvitationPrompt,
    required this.l10nInvitationDevice,
    required this.l10nInvitationPlayer,
    required this.l10nAcceptButton,
    required this.l10nRejectButton,
    required this.l10nClientSearching,
    required this.l10nClientDevicesTitle,
    required this.l10nInviteButton,
    required this.l10nInvitationSentTitle,
    required this.l10nWaitConfirmation,
    required this.l10nUnknownDevice,
    required this.l10nOurAppBadge,
    required this.l10nCancel,
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
  final String l10nHostButton;
  final String l10nClientButton;
  final String l10nModePrompt;
  final String l10nServerWaitingTitle;
  final String l10nServerWaitingBody;
  final String l10nInvitationTitle;
  final String l10nInvitationPrompt;
  final String Function(String deviceName) l10nInvitationDevice;
  final String Function(String playerName) l10nInvitationPlayer;
  final String l10nAcceptButton;
  final String l10nRejectButton;
  final String l10nClientSearching;
  final String l10nClientDevicesTitle;
  final String l10nInviteButton;
  final String l10nInvitationSentTitle;
  final String l10nWaitConfirmation;
  final String l10nUnknownDevice;
  final String l10nOurAppBadge;
  final String l10nCancel;

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
            Expanded(child: _buildBody(context)),
          ],
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return switch (overlay.phase) {
      OverlayPhase.roleSelection => _RoleSelectionBody(
        modePrompt: l10nModePrompt,
        hostButton: l10nHostButton,
        clientButton: l10nClientButton,
        onHostTap: onHostTap,
        onClientTap: onClientTap,
      ),
      OverlayPhase.hostAdvertising => _CenteredMessage(
        title: l10nServerWaitingTitle,
        body: l10nServerWaitingBody,
      ),
      OverlayPhase.hostInvitationDecision => _HostInvitationBody(
        overlay: overlay,
        invitationTitle: l10nInvitationTitle,
        invitationPrompt: l10nInvitationPrompt,
        invitationDevice: l10nInvitationDevice,
        invitationPlayer: l10nInvitationPlayer,
        acceptButton: l10nAcceptButton,
        rejectButton: l10nRejectButton,
        onAcceptTap: onAcceptTap,
        onRejectTap: onRejectTap,
      ),
      OverlayPhase.clientDiscovering => _ClientDiscoveringBody(
        overlay: overlay,
        projection: projection,
        searchingLabel: l10nClientSearching,
        devicesTitle: l10nClientDevicesTitle,
        inviteButton: l10nInviteButton,
        unknownDeviceLabel: l10nUnknownDevice,
        ourAppSubtitle: l10nOurAppBadge,
        onDeviceTap: onDeviceTap,
        onInviteTap: onInviteTap,
      ),
      OverlayPhase.clientInviting => _CenteredMessage(
        title: l10nInvitationSentTitle,
        body: l10nWaitConfirmation,
      ),
      OverlayPhase.clientInvitationRejected => _CenteredMessage(
        title: l10nInvitationSentTitle,
        body: l10nWaitConfirmation,
      ),
      OverlayPhase.error => _CenteredMessage(title: l10nInvitationTitle, body: l10nClientSearching),
      OverlayPhase.hidden => const SizedBox.shrink(),
    };
  }
}

class _RoleSelectionBody extends StatelessWidget {
  const _RoleSelectionBody({
    required this.modePrompt,
    required this.hostButton,
    required this.clientButton,
    required this.onHostTap,
    required this.onClientTap,
  });

  final String modePrompt;
  final String hostButton;
  final String clientButton;
  final VoidCallback onHostTap;
  final VoidCallback onClientTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(modePrompt, textAlign: TextAlign.center),
          const SizedBox(height: 48),
          AppElevatedButton(
            title: hostButton,
            prefix: const Icon(Icons.visibility),
            onTap: onHostTap,
          ),
          const SizedBox(height: 16),
          AppElevatedButton(
            title: clientButton,
            style: AppElevatedButtonStyle.accent,
            prefix: const Icon(Icons.search),
            onTap: onClientTap,
          ),
        ],
      ),
    );
  }
}

class _HostInvitationBody extends StatelessWidget {
  const _HostInvitationBody({
    required this.overlay,
    required this.invitationTitle,
    required this.invitationPrompt,
    required this.invitationDevice,
    required this.invitationPlayer,
    required this.acceptButton,
    required this.rejectButton,
    required this.onAcceptTap,
    required this.onRejectTap,
  });

  final OverlayRenderViewState overlay;
  final String invitationTitle;
  final String invitationPrompt;
  final String Function(String deviceName) invitationDevice;
  final String Function(String playerName) invitationPlayer;
  final String acceptButton;
  final String rejectButton;
  final VoidCallback onAcceptTap;
  final VoidCallback onRejectTap;

  @override
  Widget build(BuildContext context) {
    final PeerEndpoint? invitation = overlay.pendingInvitation;
    final String deviceName = invitation?.device.name ?? '';
    final String playerName = invitation?.identity.displayName ?? '';

    return Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(invitationTitle, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 16),
          Text(invitationDevice(deviceName)),
          Text(invitationPlayer(playerName)),
          const SizedBox(height: 8),
          Text(invitationPrompt),
          const SizedBox(height: 32),
          AppElevatedButton(title: acceptButton, onTap: onAcceptTap),
          const SizedBox(height: 12),
          AppElevatedButton(
            title: rejectButton,
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
    required this.searchingLabel,
    required this.devicesTitle,
    required this.inviteButton,
    required this.unknownDeviceLabel,
    required this.ourAppSubtitle,
    required this.onDeviceTap,
    required this.onInviteTap,
  });

  final OverlayRenderViewState overlay;
  final FrameProjectionInput projection;
  final String searchingLabel;
  final String devicesTitle;
  final String inviteButton;
  final String unknownDeviceLabel;
  final String ourAppSubtitle;
  final ValueChanged<String?> onDeviceTap;
  final VoidCallback onInviteTap;

  @override
  Widget build(BuildContext context) {
    final bool hasSelection = projection.highlightedDeviceId != null;

    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(overlay.devices.isEmpty ? searchingLabel : devicesTitle),
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
                unknownDeviceLabel: unknownDeviceLabel,
                ourAppSubtitle: ourAppSubtitle,
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: AppElevatedButton(
            title: inviteButton,
            state: hasSelection ? ElementState.enabled : ElementState.disabled,
            onTap: onInviteTap,
          ),
        ),
      ],
    );
  }
}

class _CenteredMessage extends StatelessWidget {
  const _CenteredMessage({required this.title, required this.body});

  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(title, style: Theme.of(context).textTheme.titleLarge, textAlign: TextAlign.center),
            const SizedBox(height: 16),
            Text(body, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
