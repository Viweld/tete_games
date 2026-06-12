import 'dart:math' as math;

import 'package:core_ui/core_ui.dart';

class AppLoadingIndicator extends StatefulWidget {
  final double size;
  final Color? color;

  const AppLoadingIndicator({super.key, this.size = 26, this.color});

  @override
  State<AppLoadingIndicator> createState() => _AppLoadingIndicatorState();
}

class _AppLoadingIndicatorState extends State<AppLoadingIndicator>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 1000))
      ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.colors;

    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: CustomPaint(
        painter: _WaveDotPainter(animation: _controller, color: widget.color ?? colors.icons.main),
      ),
    );
  }
}

class _WaveDotPainter extends CustomPainter {
  final Animation<double> animation;
  final Color color;

  _WaveDotPainter({required this.animation, required this.color}) : super(repaint: animation);

  static const int _dotsCount = 8;

  @override
  void paint(Canvas canvas, Size size) {
    final double maxDotDiameter = size.width / 5;
    final double minDotDiameter = size.width / 10;
    final double centerRadius = (size.width - maxDotDiameter) / 2;
    final Offset center = Offset(size.width / 2, size.height / 2);

    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    // Current rotation angle of the wave head (0..2pi)
    final double currentAngle = animation.value * 2 * math.pi;

    for (int i = 0; i < _dotsCount; i++) {
      // Angle of the dot.
      // 0 is at 3 o'clock. We place dots at 45 degree intervals.
      final double dotAngle = (i * 2 * math.pi) / _dotsCount;

      // Calculate distance from wave head (currentAngle) to this dot.
      // We want the wave to move Clockwise.
      // So effectively we look at (currentAngle - dotAngle).
      // If current == dot, diff is 0 => Max Size.
      // As current moves past dot, diff increases => Size decreases.
      double dist = (currentAngle - dotAngle) % (2 * math.pi);
      if (dist < 0) {
        dist += 2 * math.pi;
      }

      // Map dist (0..2pi) to sizeFactor (1..0)
      // We use a power curve to create a "comet" tail effect,
      // where the size drops off quickly after the head.
      // normalizedDist goes from 0 (at head) to 1 (just ahead of head).
      final double normalizedDist = dist / (2 * math.pi);

      // Using cubic drop-off for a distinct wave head
      final double sizeFactor = math.pow(1 - normalizedDist, 3).toDouble();

      final double dotDiameter = minDotDiameter + (maxDotDiameter - minDotDiameter) * sizeFactor;

      final double x = center.dx + centerRadius * math.cos(dotAngle);
      final double y = center.dy + centerRadius * math.sin(dotAngle);

      canvas.drawCircle(Offset(x, y), dotDiameter / 2, paint);
    }
  }

  @override
  bool shouldRepaint(_WaveDotPainter oldDelegate) => true;
}
