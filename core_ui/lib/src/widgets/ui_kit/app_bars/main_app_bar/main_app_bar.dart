import 'package:core/core.dart';
import 'package:core_ui/src/widgets/ui_kit/app_bars/main_app_bar/widgets/secret_mode_dialogs.dart';
import 'package:navigation/navigation.dart';

export 'widgets/app_back_button.dart';

class MainAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MainAppBar({super.key, this.bottom, this.canPop = true, this.hasSecretMode = false});

  final bool canPop;
  final PreferredSizeWidget? bottom;

  /// Enables secret mode: test runtime after 10 logo taps; exit with 1 tap in test mode.
  final bool hasSecretMode;

  static const double height = 68;

  @override
  Size get preferredSize {
    final double bottomHeight = bottom?.preferredSize.height ?? 0;
    final double appBackButtonHeight = const AppBackButton().preferredSize.height;

    return Size.fromHeight(height + (canPop ? appBackButtonHeight : bottomHeight));
  }

  @override
  State<MainAppBar> createState() => _MainAppBarState();
}

class _MainAppBarState extends State<MainAppBar> {
  int _logoTapCount = 0;
  Timer? _logoTapResetTimer;

  @override
  void dispose() {
    _logoTapResetTimer?.cancel();
    super.dispose();
  }

  void _onLogoTap() {
    if (!widget.hasSecretMode) return;

    final AppConfig config = appLocator<AppConfig>();
    if (config.runtimeMode == AppRuntimeMode.test) {
      unawaited(SecretModeDialogs.askReturnToProd(context));
      return;
    }

    _logoTapResetTimer?.cancel();
    setState(() => _logoTapCount++);
    if (_logoTapCount >= AppConstants.debugAppBarLogoTapCount) {
      setState(() => _logoTapCount = 0);
      unawaited(SecretModeDialogs.askPassword(context));
      return;
    }
    _logoTapResetTimer = Timer(AppConstants.debugLogoTapResetTimeout, () {
      if (mounted) {
        setState(() => _logoTapCount = 0);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.colors;

    final double appBarHeight = MainAppBar.height + (widget.bottom?.preferredSize.height ?? 0);
    final double fullHeight = appBarHeight + MediaQuery.of(context).padding.top;

    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      titleSpacing: 0,
      actionsPadding: EdgeInsets.zero,
      toolbarHeight: fullHeight,
      backgroundColor: colors.appBar.background,
      surfaceTintColor: colors.appBar.background,
      bottom: widget.bottom ?? (widget.canPop ? const AppBackButton() : null),
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppDimens.defaultHorizontalPadding),
        child: Align(
          alignment: Alignment.centerLeft,
          child: _MainAppBarLeading(hasSecretMode: widget.hasSecretMode, onLogoTap: _onLogoTap),
        ),
      ),
    );
  }
}

class _MainAppBarLeading extends StatelessWidget {
  const _MainAppBarLeading({required this.hasSecretMode, required this.onLogoTap});

  final bool hasSecretMode;
  final VoidCallback onLogoTap;

  static bool _stripVisible(AppConfig config) => config.runtimeMode == AppRuntimeMode.test;

  @override
  Widget build(BuildContext context) {
    final AppConfig config = appLocator<AppConfig>();
    final bool strip = _stripVisible(config);
    final Widget logo = AppIcons.appBarLogo.call(size: 20);
    final AppColorsTheme colors = context.colors;

    final Widget logoCore;
    if (hasSecretMode) {
      logoCore = GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onLogoTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
          child: logo,
        ),
      );
    } else if (strip) {
      logoCore = Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
        child: logo,
      );
    } else {
      logoCore = logo;
    }

    if (!strip) return logoCore;

    return Row(
      children: <Widget>[
        logoCore,
        Expanded(
          child: Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
              decoration: BoxDecoration(
                color: colors.borders.accentOrange,
                border: Border.all(color: colors.borders.accentError, width: 1.5),
                borderRadius: const BorderRadius.all(Radius.circular(6)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    '! ! !  TEST MODE   ! ! !',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: AppFonts.label.copyWith(color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
