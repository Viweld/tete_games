import 'package:core_ui/core_ui.dart';
import 'package:main/main/home_screen/widgets/peer_connection_overlay/widgets/peer_connection_overlay_centered_message.dart';

class OverlayPhaseHostAdvertising extends StatelessWidget {
  const OverlayPhaseHostAdvertising({super.key});

  @override
  Widget build(BuildContext context) {
    return const PeerConnectionOverlayCenteredMessage(showsLoadingIndicator: true);
  }
}
