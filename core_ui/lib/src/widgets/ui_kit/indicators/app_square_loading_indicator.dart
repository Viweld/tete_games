import 'dart:math' as math;

import 'package:core_ui/core_ui.dart';

class AppSquareLoadingIndicator extends StatefulWidget {
  const AppSquareLoadingIndicator({
    super.key,
    this.size = 26,
    this.color,
    this.duration = const Duration(milliseconds: 1200),
  });

  final double size;
  final Color? color;
  final Duration duration;

  @override
  State<AppSquareLoadingIndicator> createState() => _AppSquareLoadingIndicatorState();
}

class _AppSquareLoadingIndicatorState extends State<AppSquareLoadingIndicator>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _anim1;
  late final Animation<double> _anim2;
  late final Animation<double> _anim3;
  late final Animation<double> _anim4;
  late final Animation<double> _anim5;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..repeat(reverse: true);
    _anim1 = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.1, 0.6, curve: Curves.easeIn),
      ),
    );
    _anim2 = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.2, 0.7, curve: Curves.easeIn),
      ),
    );
    _anim3 = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.3, 0.8, curve: Curves.easeIn),
      ),
    );
    _anim4 = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.4, 0.9, curve: Curves.easeIn),
      ),
    );
    _anim5 = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.5, 1, curve: Curves.easeIn),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color color = widget.color ?? context.colors.icons.main;
    final double cellSize = widget.size / 3;

    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget? child) {
        final double angle = _controller.status == AnimationStatus.forward ? 0 : math.pi;
        return Transform.rotate(angle: angle, child: child);
      },
      child: SizedBox.fromSize(
        size: Size.square(widget.size),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _AppSquareLoadingCubeCell(animation: _anim3, cellSize: cellSize, color: color),
                _AppSquareLoadingCubeCell(animation: _anim4, cellSize: cellSize, color: color),
                _AppSquareLoadingCubeCell(animation: _anim5, cellSize: cellSize, color: color),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _AppSquareLoadingCubeCell(animation: _anim2, cellSize: cellSize, color: color),
                _AppSquareLoadingCubeCell(animation: _anim3, cellSize: cellSize, color: color),
                _AppSquareLoadingCubeCell(animation: _anim4, cellSize: cellSize, color: color),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _AppSquareLoadingCubeCell(animation: _anim1, cellSize: cellSize, color: color),
                _AppSquareLoadingCubeCell(animation: _anim2, cellSize: cellSize, color: color),
                _AppSquareLoadingCubeCell(animation: _anim3, cellSize: cellSize, color: color),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _AppSquareLoadingCubeCell extends StatelessWidget {
  const _AppSquareLoadingCubeCell({
    required this.animation,
    required this.cellSize,
    required this.color,
  });

  final Animation<double> animation;
  final double cellSize;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: animation,
      child: SizedBox.fromSize(
        size: Size.square(cellSize),
        child: DecoratedBox(decoration: BoxDecoration(color: color)),
      ),
    );
  }
}
