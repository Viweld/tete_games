import 'dart:math' as math;

import 'package:core_ui/core_ui.dart';

class AppDotsLoadingIndicator extends StatefulWidget {
  const AppDotsLoadingIndicator({
    super.key,
    this.size = 20,
    this.color,
    this.duration = const Duration(milliseconds: 1400),
  });

  final double size;
  final Color? color;
  final Duration duration;

  @override
  State<AppDotsLoadingIndicator> createState() => _AppDotsLoadingIndicatorState();
}

class _AppDotsLoadingIndicatorState extends State<AppDotsLoadingIndicator>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final List<Animation<double>> _scaleAnimations;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: widget.duration)..repeat();
    _scaleAnimations = List<Animation<double>>.generate(3, (int index) {
      return _DelayTween(begin: 0, end: 1, delay: index * 0.2).animate(_controller);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color color = widget.color ?? context.colors.icons.main;
    final double dotSize = widget.size * 0.5;

    return SizedBox.fromSize(
      size: Size(widget.size * 2, widget.size),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          for (int index = 0; index < 3; index++)
            _AppDotsLoadingDot(scale: _scaleAnimations[index], dotSize: dotSize, color: color),
        ],
      ),
    );
  }
}

class _AppDotsLoadingDot extends StatelessWidget {
  const _AppDotsLoadingDot({required this.scale, required this.dotSize, required this.color});

  final Animation<double> scale;
  final double dotSize;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: scale,
      child: SizedBox.fromSize(
        size: Size.square(dotSize),
        child: DecoratedBox(
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
      ),
    );
  }
}

class _DelayTween extends Tween<double> {
  _DelayTween({required super.begin, required super.end, required this.delay});

  final double delay;

  @override
  double lerp(double t) {
    return super.lerp(((math.max(0, t - delay)) / (1 - delay)).clamp(0.0, 1.0));
  }
}
