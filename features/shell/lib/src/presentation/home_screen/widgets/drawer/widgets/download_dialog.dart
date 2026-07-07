import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';

class DownloadDialog extends StatelessWidget {
  const DownloadDialog._();

  static Future<void> show(BuildContext context) {
    return showDialog<void>(
      context: context,
      barrierColor: context.colors.barrierColor,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: context.colors.barrierBlurSigma,
            sigmaY: context.colors.barrierBlurSigma,
          ),
          child: const DownloadDialog._(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalization localization = context.localization;
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
                      child: Text(
                        localization.peer_home_drawer_download,
                        style: AppFonts.h3.copyWith(color: colors.text.main),
                      ),
                    ),
                    const SizedBox(width: 8),
                    InkWell(
                      onTap: () => Navigator.of(context).pop(),
                      child: AppIcons.cross(color: colors.text.secondary),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Center(child: AppQrCode(data: AppConstants.appDownloadUrl)),
                const SizedBox(height: 16),
                Text(
                  localization.peer_home_drawer_download_hint,
                  style: AppFonts.b2.copyWith(color: colors.text.main),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                AppElevatedButton(
                  title: localization.peer_dialog_ok,
                  onTap: () => Navigator.of(context).pop(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
