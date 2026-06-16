import 'dart:ui';

import 'package:core_ui/core_ui.dart';
import 'package:flutter/services.dart';

class AppLoaderOverlay extends StatelessWidget {
  final String title;
  final String? comment;

  const AppLoaderOverlay._({required this.title, this.comment});

  static Future<void> show(
    BuildContext context, {
    required String title,
    String? comment,
    bool barrierDismissible = false,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      barrierColor: context.colors.barrierColor,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: context.colors.barrierBlurSigma,
            sigmaY: context.colors.barrierBlurSigma,
          ),
          child: AppLoaderOverlay._(title: title, comment: comment),
        );
      },
    );
  }

  static void hide(BuildContext context) {
    if (!Navigator.of(context, rootNavigator: true).canPop()) return;
    Navigator.of(context, rootNavigator: true).pop();
  }

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.colors;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, _) {
        if (didPop) return;
        SystemNavigator.pop();
      },
      child: Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        insetPadding: const EdgeInsets.symmetric(horizontal: 50),
        child: Center(
          child: Container(
            width: 260,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
            decoration: BoxDecoration(
              color: colors.background.secondaryCard,
              borderRadius: BorderRadius.circular(12),
              boxShadow: colors.dialogShadows,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: AppFonts.h5.copyWith(color: context.colors.text.main),
                ),
                if (comment != null) ...<Widget>[
                  const SizedBox(height: 12),
                  Text(
                    comment!,
                    textAlign: TextAlign.center,
                    style: AppFonts.b1.copyWith(color: context.colors.text.main),
                  ),
                ],
                const SizedBox(height: 20),
                const SizedBox(height: 40, child: Center(child: AppSquareLoadingIndicator())),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
