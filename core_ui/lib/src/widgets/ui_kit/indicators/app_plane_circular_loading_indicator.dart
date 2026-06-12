import 'dart:async';
import 'dart:math';

import 'package:core_ui/core_ui.dart';
import 'package:sealed_countries/sealed_countries.dart';

class AppPlaneCircularLoadingIndicator extends StatefulWidget {
  const AppPlaneCircularLoadingIndicator({
    super.key,
    this.size,
    this.strokeWidth,
    this.color,
    this.backgroundColor,
    this.planeColor,
    this.flagChangeInterval = const Duration(milliseconds: 400),
  });

  final double? size;
  final double? strokeWidth;
  final Color? color;
  final Color? backgroundColor;
  final Color? planeColor;
  final Duration flagChangeInterval;

  @override
  State<AppPlaneCircularLoadingIndicator> createState() => _AppPlaneCircularLoadingIndicatorState();
}

class _AppPlaneCircularLoadingIndicatorState extends State<AppPlaneCircularLoadingIndicator>
    with SingleTickerProviderStateMixin {
  static final List<String> _allCountryCodes = WorldCountry.list
      .map((WorldCountry country) => country.codeShort.toLowerCase())
      .toList(growable: false);

  late final AnimationController _controller;
  late final Random _random;
  late String _currentCountryCode;
  Timer? _flagTimer;

  @override
  void initState() {
    super.initState();
    _random = Random();
    _currentCountryCode = _allCountryCodes[_random.nextInt(_allCountryCodes.length)];
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 3000))
      ..repeat();
    _flagTimer = Timer.periodic(widget.flagChangeInterval, (_) => _rotateCountryFlag());
  }

  @override
  void didUpdateWidget(covariant AppPlaneCircularLoadingIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.flagChangeInterval != widget.flagChangeInterval) {
      _flagTimer?.cancel();
      _flagTimer = Timer.periodic(widget.flagChangeInterval, (_) => _rotateCountryFlag());
    }
  }

  @override
  void dispose() {
    _flagTimer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  void _rotateCountryFlag() {
    if (!mounted) return;
    setState(() => _currentCountryCode = _pickNextCountryCode());
  }

  String _pickNextCountryCode() {
    if (_allCountryCodes.length <= 1) {
      return _allCountryCodes.first;
    }

    String nextCode;
    do {
      nextCode = _allCountryCodes[_random.nextInt(_allCountryCodes.length)];
    } while (nextCode == _currentCountryCode);

    return nextCode;
  }

  @override
  Widget build(BuildContext context) {
    final double indicatorSize = widget.size ?? 48;
    final AppColorsTheme colors = context.colors;

    final Color effectivePlaneColor = widget.planeColor ?? widget.color ?? colors.text.main;

    final double orbitSize = indicatorSize + 80;
    final double planeSize = indicatorSize * 0.5;
    final double orbitRadius = (orbitSize / 2) - (planeSize / 2);
    final double flagSize = indicatorSize;

    return SizedBox.square(
      dimension: orbitSize,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          //AppLoadingIndicator(size: indicatorSize, color: effectiveIndicatorColor),
          _CenterRandomFlagSwitcher(countryCode: _currentCountryCode, size: flagSize),
          AnimatedBuilder(
            animation: _controller,
            builder: (BuildContext context, Widget? child) {
              final double angle = -_controller.value * 2 * pi;

              return Transform.rotate(
                angle: angle,
                child: Transform.translate(
                  offset: Offset(0, -orbitRadius),
                  child: Transform.rotate(angle: 1.5 * pi, child: child),
                ),
              );
            },
            child: Icon(
              Icons.airplanemode_active_rounded,
              color: effectivePlaneColor,
              size: planeSize,
            ),
          ),
        ],
      ),
    );
  }
}

class _CenterRandomFlagSwitcher extends StatelessWidget {
  const _CenterRandomFlagSwitcher({required this.countryCode, required this.size});

  final String countryCode;
  final double size;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 350),
      switchInCurve: Curves.easeOut,
      switchOutCurve: Curves.easeIn,
      transitionBuilder: (Widget child, Animation<double> animation) {
        final Animation<double> fadeAnimation = CurvedAnimation(
          parent: animation,
          curve: Curves.easeOut,
        );
        final Animation<double> scaleAnimation = Tween<double>(
          begin: 0.85,
          end: 1,
        ).animate(CurvedAnimation(parent: animation, curve: Curves.easeOutBack));

        return FadeTransition(
          opacity: fadeAnimation,
          child: ScaleTransition(scale: scaleAnimation, child: child),
        );
      },
      child: _CenterRandomFlag(
        key: ValueKey<String>(countryCode),
        countryCode: countryCode,
        size: size,
      ),
    );
  }
}

class _CenterRandomFlag extends StatelessWidget {
  const _CenterRandomFlag({required super.key, required this.countryCode, required this.size});

  final String countryCode;
  final double size;

  @override
  Widget build(BuildContext context) {
    return AppCircleFlag(countryCode: countryCode, size: size);
  }
}
