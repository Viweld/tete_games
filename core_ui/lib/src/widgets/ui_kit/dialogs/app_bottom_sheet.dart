import 'dart:ui';

import 'package:core_ui/core_ui.dart';

/// App dialog. Implemented as a modal bottom sheet.
abstract class AppBottomSheet {
  /// Shows a simple dialog with custom content.
  static Future<T?> show<T>(
    BuildContext context, {
    required String title,
    required WidgetBuilder contentBuilder,
  }) {
    final AppColorsTheme colors = context.colors;

    return showModalBottomSheet<T?>(
      context: context,
      isScrollControlled: true,
      barrierColor: colors.barrierColor,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => Navigator.of(context).pop(),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: colors.barrierBlurSigma,
                sigmaY: colors.barrierBlurSigma,
              ),
              child: const SizedBox(),
            ),
            GestureDetector(
              onTap: () {},
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: colors.background.secondaryCard,
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                  boxShadow: colors.dialogShadows,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(14, 20, 14, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              title,
                              style: AppFonts.h4.copyWith(color: colors.text.main),
                            ),
                          ),
                          const SizedBox(width: 8),
                          AppIcons.cross.call(
                            size: 24,
                            color: colors.icons.main,
                            onTap: () => Navigator.maybePop(context),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 14,
                        left: 14,
                        right: 14,
                        bottom: 40 + MediaQuery.of(context).padding.bottom,
                      ),
                      child: contentBuilder.call(context),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Shows a dialog with scrollable content using [DraggableScrollableSheet].
  ///
  /// Use this variant when the dialog content may be large and needs scrolling.
  /// The sheet supports snap behavior and can be dismissed by tapping the backdrop.
  // ignore: number_of_parameters
  static Future<T?> showScrollable<T>(
    BuildContext context, {
    required String title,
    Widget Function(BuildContext context, Widget child)? blocProviderBuilder,
    required WidgetBuilder headerBuilder,
    required Widget Function(BuildContext context, ScrollController controller)
    scrollableListBuilder,
    required WidgetBuilder footerBuilder,
    double minChildSize = 0.4,
    double maxChildSize = 0.6,
    double initialChildSize = 0.6,
  }) {
    final AppColorsTheme colors = context.colors;

    return showModalBottomSheet<T?>(
      context: context,
      isScrollControlled: true,
      barrierColor: colors.barrierColor,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => Navigator.of(context).pop(),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: colors.barrierBlurSigma,
                sigmaY: colors.barrierBlurSigma,
              ),
              child: const SizedBox(),
            ),
            Builder(
              builder: (BuildContext context) {
                Widget sheet = GestureDetector(
                  onTap: () {},
                  child: DraggableScrollableSheet(
                    minChildSize: minChildSize,
                    maxChildSize: maxChildSize,
                    initialChildSize: initialChildSize,
                    snap: true,
                    builder: (BuildContext context, ScrollController scrollController) {
                      return DecoratedBox(
                        decoration: BoxDecoration(
                          color: colors.background.secondaryCard,
                          borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                          boxShadow: colors.dialogShadows,
                        ),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(14, 20, 14, 14),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Expanded(
                                    child: Text(
                                      title,
                                      style: AppFonts.h4.copyWith(color: colors.text.main),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  AppIcons.cross.call(
                                    size: 24,
                                    color: colors.icons.main,
                                    onTap: () => Navigator.maybePop(context),
                                  ),
                                ],
                              ),
                            ),
                            headerBuilder.call(context),
                            Expanded(child: scrollableListBuilder(context, scrollController)),
                            footerBuilder.call(context),
                          ],
                        ),
                      );
                    },
                  ),
                );

                if (blocProviderBuilder != null) {
                  sheet = blocProviderBuilder(context, sheet);
                }

                return sheet;
              },
            ),
          ],
        ),
      ),
    );
  }
}
