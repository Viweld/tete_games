import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';

enum ToastType { error, success, warning, info }

class GlobalToastHost extends StatefulWidget {
  final Widget child;

  const GlobalToastHost({required this.child, super.key});

  @override
  State<GlobalToastHost> createState() => _GlobalToastHostState();
}

class _GlobalToastHostState extends State<GlobalToastHost> {
  static const Duration _toastDuration = Duration(seconds: 3);
  static const Duration _swipeDismissDuration = Duration(milliseconds: 220);
  static const double _horizontalPadding = 14;
  static const double _topOffsetFromStatusBar = 19;
  static const double _swipeDismissThreshold = 24;

  late final StreamSubscription<AppToastEvent> _toastSubscription;

  Timer? _hideTimer;
  String? _message;
  ToastType? _toastType;
  bool _visible = false;
  double _dragOffset = 0;
  bool _isSwipeDismissing = false;

  @override
  void initState() {
    super.initState();
    _toastSubscription = appLocator<AppToastBus>().stream.listen(_onToastEvent);
  }

  @override
  void dispose() {
    _toastSubscription.cancel();
    _hideTimer?.cancel();
    super.dispose();
  }

  void _onToastEvent(AppToastEvent event) {
    if (!mounted) return;
    switch (event) {
      case ErrorToastEvent():
        _showToast(event.message, ToastType.error);
      case SuccessToastEvent():
        _showToast(event.message, ToastType.success);
      case WarningToastEvent():
        _showToast(event.message, ToastType.warning);
      case InfoToastEvent():
        _showToast(event.message, ToastType.info);
    }
  }

  void _showToast(String? message, ToastType type) {
    final AppLocalization localization = context.localization;

    setState(() {
      _message = message ?? localization.something_went_wrong;
      _toastType = type;
      _visible = true;
      _dragOffset = 0;
      _isSwipeDismissing = false;
    });

    _hideTimer?.cancel();
    _hideTimer = Timer(_toastDuration, _hideToast);
  }

  void _hideToast() {
    _hideTimer?.cancel();
    if (!mounted) return;
    setState(() {
      _visible = false;
      _dragOffset = 0;
      _isSwipeDismissing = false;
    });
  }

  void _dismissBySwipe() {
    _hideTimer?.cancel();
    if (!mounted || _isSwipeDismissing) return;

    setState(() {
      _isSwipeDismissing = true;
      _dragOffset = (_dragOffset - 120).clamp(-400, -80);
    });

    Timer(_swipeDismissDuration, () {
      if (!mounted) return;
      setState(() {
        _visible = false;
        _dragOffset = 0;
        _isSwipeDismissing = false;
      });
    });
  }

  Color _toastColor(AppColorsTheme colors) {
    return switch (_toastType) {
      ToastType.error => colors.toast.error,
      ToastType.success => colors.toast.success,
      ToastType.warning => colors.toast.warning,
      ToastType.info => colors.toast.info,
      null => colors.toast.error,
    };
  }

  Widget _toastIcon(AppColorsTheme colors) {
    return switch (_toastType) {
      ToastType.error => AppIcons.toastError.call(color: colors.icons.white, size: 18),
      ToastType.success => AppIcons.toastSuccess.call(color: colors.icons.white, size: 18),
      ToastType.warning => AppIcons.toastWarning.call(color: colors.icons.white, size: 18),
      ToastType.info => AppIcons.toastInfo.call(color: colors.icons.white, size: 18),
      null => AppIcons.toastError.call(color: colors.icons.white, size: 18),
    };
  }

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.colors;
    final double topPosition = MediaQuery.paddingOf(context).top + _topOffsetFromStatusBar;

    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        widget.child,
        Positioned(
          top: topPosition,
          left: _horizontalPadding,
          right: _horizontalPadding,
          child: Align(
            alignment: Alignment.centerLeft,
            child: AnimatedSlide(
              duration: const Duration(milliseconds: 220),
              curve: Curves.easeOutCubic,
              offset: _isSwipeDismissing
                  ? Offset.zero
                  : (_visible ? Offset.zero : const Offset(0, -1.2)),
              child: AnimatedOpacity(
                duration: _isSwipeDismissing
                    ? _swipeDismissDuration
                    : const Duration(milliseconds: 180),
                opacity: _isSwipeDismissing ? 0 : (_visible ? 1 : 0),
                child: Transform.translate(
                  offset: Offset(0, _dragOffset),
                  child: GestureDetector(
                    onVerticalDragUpdate: (DragUpdateDetails details) {
                      if (!_visible || _isSwipeDismissing) return;
                      final double delta = details.primaryDelta ?? 0;
                      if (delta >= 0) return;
                      setState(() {
                        _dragOffset += delta;
                      });
                    },
                    onVerticalDragEnd: (DragEndDetails details) {
                      if (!_visible || _isSwipeDismissing) return;
                      final double velocity = details.primaryVelocity ?? 0;
                      if (velocity < -300 || _dragOffset <= -_swipeDismissThreshold) {
                        _dismissBySwipe();
                        return;
                      }
                      setState(() {
                        _dragOffset = 0;
                      });
                    },
                    child: Material(
                      color: Colors.transparent,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: _toastColor(colors),
                          borderRadius: BorderRadius.circular(6),
                          boxShadow: colors.dropdownShadows,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 6, 12, 6),
                          child: Row(
                            spacing: 6,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              _toastIcon(colors),
                              Flexible(
                                child: Text(
                                  _message ?? '',
                                  style: AppFonts.caption.copyWith(color: colors.text.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
