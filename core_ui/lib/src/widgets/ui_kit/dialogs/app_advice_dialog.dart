import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';

class AppAdviceDialog extends StatelessWidget {
  final String title;
  final Widget content;
  final String outlinedButtonText;
  final String accentButtonText;

  const AppAdviceDialog._({
    required this.title,
    required this.content,
    required this.outlinedButtonText,
    required this.accentButtonText,
  });

  static Future<bool?> show(
    BuildContext context, {
    required String title,
    required Widget content,
    required String outlinedButtonText,
    required String accentButtonText,
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
          child: AppAdviceDialog._(
            title: title,
            content: content,
            outlinedButtonText: outlinedButtonText,
            accentButtonText: accentButtonText,
          ),
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
                content,
                const SizedBox(height: 24),
                AppOutlinedButton(
                  title: outlinedButtonText,
                  onTap: () => Navigator.of(context).pop(false),
                ),
                const SizedBox(height: 12),
                AppElevatedButton(
                  title: accentButtonText,
                  onTap: () => Navigator.of(context).pop(true),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
