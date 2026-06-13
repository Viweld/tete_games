import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';

/// Hidden API mode switch dialogs (test / prod) with soft restart.
abstract final class SecretModeDialogs {
  static Future<void> askPassword(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) => const _SecretPasswordDialog(),
    );
  }

  static Future<void> askReturnToProd(BuildContext context) async {
    final AppLocalization l10n = context.localization;
    final bool? confirmed = await AppWarningDialog.show(
      context,
      title: l10n.secret_mode_production_mode_title,
      message: l10n.secret_mode_return_to_production_message,
      primaryButtonText: l10n.secret_mode_yes,
      secondaryButtonText: l10n.secret_mode_no,
    );
    if (confirmed != true || !context.mounted) return;
    await AppRuntimeModeStorage.write(AppRuntimeMode.prod);
    await appLocator<AppRestarter>().restart();
  }
}

class _SecretPasswordDialog extends StatefulWidget {
  const _SecretPasswordDialog();

  @override
  State<_SecretPasswordDialog> createState() => _SecretPasswordDialogState();
}

class _SecretPasswordDialogState extends State<_SecretPasswordDialog> {
  final TextEditingController _passwordController = TextEditingController();
  String? _passwordError;

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _onOkPressed() async {
    final String entered = _passwordController.text;
    if (entered != AppConstants.debugApiUnlockPassword) {
      setState(() => _passwordError = _wrongPasswordMessage(context));
      return;
    }

    await AppRuntimeModeStorage.write(AppRuntimeMode.test);
    if (mounted) {
      Navigator.of(context).pop();
    }
    await appLocator<AppRestarter>().restart();
  }

  String _wrongPasswordMessage(BuildContext context) {
    return context.localization.secret_mode_wrong_password;
  }

  String _title(BuildContext context) {
    return context.localization.secret_mode_test_api_title;
  }

  String _passwordHint(BuildContext context) {
    return context.localization.secret_mode_password_hint;
  }

  String _okLabel(BuildContext context) {
    return context.localization.secret_mode_ok;
  }

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.colors;

    return AlertDialog(
      title: Text(_title(context), style: AppFonts.h6.copyWith(color: colors.text.main)),
      content: TextField(
        controller: _passwordController,
        obscureText: true,
        decoration: InputDecoration(hintText: _passwordHint(context), errorText: _passwordError),
        onChanged: (_) {
          if (_passwordError != null) {
            setState(() => _passwordError = null);
          }
        },
      ),
      actions: <Widget>[TextButton(onPressed: _onOkPressed, child: Text(_okLabel(context)))],
    );
  }
}
