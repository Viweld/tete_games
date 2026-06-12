import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';

class AppProposalDialog extends StatelessWidget {
  final String title;
  final String message;
  final String buttonText;

  const AppProposalDialog._({required this.title, required this.message, required this.buttonText});

  static Future<bool?> show(
    BuildContext context, {
    required String title,
    required String message,
    required String buttonText,
  }) {
    return showDialog<bool>(
      context: context,
      barrierColor: context.colors.barrierColor,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: context.colors.barrierBlurSigma,
            sigmaY: context.colors.barrierBlurSigma,
          ),
          child: AppProposalDialog._(title: title, message: message, buttonText: buttonText),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.colors;

    return PopScope(
      child: Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        insetPadding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: Container(
            width: double.infinity,
            constraints: const BoxConstraints(maxWidth: 340),
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: colors.background.secondaryCard,
              borderRadius: BorderRadius.circular(20),
              boxShadow: colors.dialogShadows,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Text(title, style: AppFonts.h3.copyWith(color: colors.text.main)),
                    ),
                    const SizedBox(width: 8),
                    InkWell(
                      onTap: () => Navigator.of(context).pop(),
                      child: AppIcons.cross(color: colors.text.secondary),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(message, style: AppFonts.b2.copyWith(color: colors.text.main)),
                const SizedBox(height: 24),
                AppElevatedButton(onTap: () => Navigator.of(context).pop(true), title: buttonText),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
