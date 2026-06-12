import 'package:core/core.dart';
import 'package:core_ui/src/widgets/ui_kit/app_bars/main_app_bar/widgets/secret_mode_dialogs.dart';
import 'package:core_ui/src/widgets/ui_kit/app_bars/main_app_bar_notifications/main_app_bar_notification.dart';
import 'package:navigation/navigation.dart';

export 'bloc/main_app_bar_bloc.dart';
export 'widgets/app_back_button.dart';

class MainAppBar extends StatefulWidget implements PreferredSizeWidget {
  final bool canPop;
  final PreferredSizeWidget? bottom;

  /// Enables secret mode: test API after 10 logo taps; exit with 1 tap in test mode.
  final bool hasSecretMode;

  const MainAppBar({super.key, this.bottom, this.canPop = true, this.hasSecretMode = false});

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
    final AppRouter router = appLocator<AppRouter>();

    final double appBarHeight = MainAppBar.height + (widget.bottom?.preferredSize.height ?? 0);

    final double fullHeight = appBarHeight + MediaQuery.of(context).padding.top;

    return BlocProvider<MainAppBarBloc>(
      create: (_) => appLocator<MainAppBarBloc>(),
      child: BlocBuilder<MainAppBarBloc, MainAppBarState>(
        builder: (BuildContext context, MainAppBarState state) {
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
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: _MainAppBarLeading(
                        hasSecretMode: widget.hasSecretMode,
                        onLogoTap: _onLogoTap,
                      ),
                    ),
                  ),
                  SizedBox.square(
                    dimension: 40,
                    child: Center(
                      child: AppIcons.appBarBubble.call(
                        size: 24,
                        color: colors.appBar.icon,
                        onTap: router.navigateSupport,
                      ),
                    ),
                  ),
                  const AppBarBellButton(),
                  if (state.profile != null)
                    AppUserAvatar.mini(
                      email: state.profile?.email ?? '',
                      avatarUrl: state.profile?.avatar?.small,
                      name: state.profile?.userName,
                      onTap: router.navigatePersonalData,
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _MainAppBarLeading extends StatelessWidget {
  const _MainAppBarLeading({required this.hasSecretMode, required this.onLogoTap});

  final bool hasSecretMode;
  final VoidCallback onLogoTap;

  static bool _stripVisible(AppConfig config) =>
      config.flavor == Flavor.prod && config.runtimeMode == AppRuntimeMode.test;

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
      // alignment: Alignment.bottomLeft,
      // clipBehavior: Clip.none,
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
                    '! ! !  TEST API   ! ! !',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: AppFonts.label.copyWith(color: Colors.black),
                  ),
                  Text(
                    'some services unavailable',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: AppFonts.caption.copyWith(color: Colors.black),
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
