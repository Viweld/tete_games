import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:shell/src/presentation/home_screen/widgets/connection_overlay/widgets/centered_message.dart';

class PhaseError extends StatelessWidget {
  const PhaseError({super.key, required this.onRetryTap});

  final VoidCallback onRetryTap;

  @override
  Widget build(BuildContext context) {
    final AppLocalization localization = context.localization;

    return CenteredMessage.error(
      title: localization.peer_dialog_error_title,
      body: localization.peer_client_error_connection,
      actionLabel: localization.peer_home_retry_button,
      onActionTap: onRetryTap,
    );
  }
}
