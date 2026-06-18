import 'package:core_ui/core_ui.dart';

class AppScaffold extends StatelessWidget {
  final FragmentState state;
  final Widget body;
  final Widget? customInitIndicator;
  final bool hasScrollBody;
  final bool hasSafeArea;
  final Color? backgroundColor;
  final EdgeInsets? pagePadding;
  final String? errorText;
  final VoidCallback? onRefresh;
  final PreferredSizeWidget? appBar;
  final Widget? endDrawer;
  final bool isLoading;
  final bool resizeToAvoidBottomInset;

  const AppScaffold({
    required this.body,
    this.customInitIndicator,
    this.state = FragmentState.active,
    this.hasScrollBody = false,
    this.hasSafeArea = true,
    this.isLoading = false,
    this.resizeToAvoidBottomInset = true,
    this.onRefresh,
    this.errorText,
    this.backgroundColor,
    this.pagePadding,
    this.appBar,
    this.endDrawer,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.colors;
    final Color backgroundColor = this.backgroundColor ?? colors.background.main;

    Widget child = switch (state) {
      FragmentState.active => body,
      FragmentState.loading => Center(
        child: customInitIndicator ?? const AppSquareLoadingIndicator(),
      ),
      FragmentState.error => AppRetry(message: errorText, onTap: onRefresh),
    };

    if (hasScrollBody) {
      child = SingleChildScrollView(physics: const ClampingScrollPhysics(), child: child);
    }

    if (hasSafeArea) {
      child = SafeArea(left: false, right: false, child: child);
    }

    if (onRefresh != null) {
      child = RefreshIndicator(onRefresh: () async => onRefresh?.call(), child: child);
    }

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: backgroundColor,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        extendBody: true,
        appBar: appBar,
        endDrawer: endDrawer,
        body: Stack(
          children: <Widget>[
            Padding(
              padding:
                  pagePadding ??
                  const EdgeInsets.symmetric(horizontal: AppDimens.defaultHorizontalPadding),
              child: child,
            ),
            SizedBox(
              height: 2,
              child: isLoading ? LinearProgressIndicator(color: colors.progressIndicator) : null,
            ),
          ],
        ),
      ),
    );
  }
}
