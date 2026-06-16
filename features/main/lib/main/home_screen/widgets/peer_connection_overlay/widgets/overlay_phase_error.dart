import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:main/main/home_screen/widgets/peer_connection_overlay/widgets/peer_connection_overlay_centered_message.dart';

class OverlayPhaseError extends StatelessWidget {
  const OverlayPhaseError({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalization localization = context.localization;

    return PeerConnectionOverlayCenteredMessage(
      title: localization.peer_dialog_error_title,
      body: localization.peer_client_error_connection,
    );
  }
}
