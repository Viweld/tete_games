import 'package:core_ui/core_ui.dart';

class AppCheckbox extends StatefulWidget {
  final bool value;
  final bool hasError;
  final ValueChanged<bool> onChanged;
  final AppSelectionSize size;
  final Widget? label;
  final bool isHalo;
  final bool enabled;

  /// When true, the checkbox absorbs pointer events and shows no ripple.
  /// Use this when the checkbox is embedded inside a larger tappable widget.
  final bool absorbPointer;

  const AppCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    this.hasError = false,
    this.size = AppSelectionSize.small,
    this.label,
    this.isHalo = false,
    this.enabled = true,
    this.absorbPointer = false,
  });

  @override
  State<AppCheckbox> createState() => _AppCheckboxState();
}

class _AppCheckboxState extends State<AppCheckbox> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _checkAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: const Duration(milliseconds: 200), vsync: this);
    _checkAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);

    if (widget.value) {
      _controller.value = 1.0;
    }
  }

  @override
  void didUpdateWidget(AppCheckbox oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != oldWidget.value) {
      if (widget.value) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.colors;

    // Determine colors
    // Inactive/Disabled
    final bool isInactive = !widget.enabled;

    Color borderColor;
    Color checkColor;
    Color haloColor;

    if (isInactive) {
      borderColor = colors.selection.borderInactive; // #B6C0D5
      checkColor = colors.selection.borderInactive; // #B6C0D5
      haloColor = Colors.transparent;
    } else if (widget.hasError) {
      borderColor = colors.selection.borderError;
      checkColor = colors.selection.borderError;
      haloColor = colors.selection.borderError.withValues(alpha: 0.1);
    } else {
      borderColor = colors.selection.border; // #002E75
      checkColor = colors.selection.iconOnFill; // #002E75
      haloColor = colors.selection.halo;
    }

    final Widget inkWidget = Theme(
      data: Theme.of(context).copyWith(
        splashColor: haloColor.withValues(alpha: 0.1),
        highlightColor: haloColor.withValues(alpha: 0.1),
      ),
      child: InkResponse(
        onTap: widget.enabled ? () => widget.onChanged(!widget.value) : null,
        radius: 20, // 40px diameter
        child: SizedBox(
          width: 40,
          height: 40,
          child: CustomPaint(
            painter: _CheckboxPainter(
              borderColor: borderColor,
              checkColor: checkColor,
              progress: _checkAnimation,
            ),
          ),
        ),
      ),
    );

    if (widget.absorbPointer) {
      return AbsorbPointer(child: inkWidget);
    }

    return inkWidget;
  }
}

class _CheckboxPainter extends CustomPainter {
  final Color borderColor;
  final Color checkColor;
  final Animation<double> progress;

  _CheckboxPainter({required this.borderColor, required this.checkColor, required this.progress})
    : super(repaint: progress);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint borderPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.fill;

    final Paint checkPaint = Paint()
      ..color = checkColor
      ..style = PaintingStyle.fill;

    // Path 1 (Border)
    final Path borderPath = Path();
    borderPath.moveTo(12, 10);
    borderPath.cubicTo(10.8954, 10, 10, 10.8954, 10, 12);
    borderPath.lineTo(10, 28);
    borderPath.cubicTo(10, 29.1046, 10.8954, 30, 12, 30);
    borderPath.lineTo(28, 30);
    borderPath.cubicTo(29.1046, 30, 30, 29.1046, 30, 28);
    borderPath.lineTo(30, 12);
    borderPath.cubicTo(30, 10.8954, 29.1046, 10, 28, 10);
    borderPath.lineTo(12, 10);
    // Z - implied closed
    borderPath.moveTo(28, 26);
    borderPath.cubicTo(28, 27.1046, 27.1046, 28, 26, 28);
    borderPath.lineTo(14, 28);
    borderPath.cubicTo(12.8954, 28, 12, 27.1046, 12, 26);
    borderPath.lineTo(12, 14);
    borderPath.cubicTo(12, 12.8954, 12.8954, 12, 14, 12);
    borderPath.lineTo(26, 12);
    borderPath.cubicTo(27.1046, 12, 28, 12.8954, 28, 14);
    borderPath.lineTo(28, 26);
    borderPath.close();

    borderPath.fillType = PathFillType.evenOdd;

    canvas.drawPath(borderPath, borderPaint);

    // Path 2 (Checkmark)
    if (progress.value > 0) {
      final Path checkPath = Path();
      checkPath.moveTo(24.3339, 15.0067);
      checkPath.cubicTo(24.6869, 14.5158, 25.4095, 14.4934, 25.7923, 14.9615);
      checkPath.cubicTo(26.0512, 15.2781, 26.0699, 15.7276, 25.8382, 16.0646);
      checkPath.lineTo(19.8591, 24.7609);
      checkPath.cubicTo(19.4896, 25.2984, 18.7037, 25.3208, 18.3042, 24.8051);
      checkPath.lineTo(14.2002, 19.5084);
      checkPath.cubicTo(13.8653, 19.0762, 13.9609, 18.4515, 14.4097, 18.1391);
      checkPath.cubicTo(14.819, 17.8543, 15.3784, 17.9321, 15.6944, 18.3177);
      checkPath.lineTo(18.2333, 21.4155);
      checkPath.cubicTo(18.6345, 21.905, 19.3906, 21.8811, 19.7601, 21.3673);
      checkPath.lineTo(24.3339, 15.0067);
      checkPath.close();

      if (progress.value < 1.0) {
        // Use transform matrix
        // center (20, 20)
        final Matrix4 matrix = Matrix4.identity()
          ..translateByDouble(20.0, 20.0, 0.0, 1.0)
          ..scaleByDouble(progress.value, progress.value, 1.0, 1.0)
          ..translateByDouble(-20.0, -20.0, 0.0, 1.0);

        final Path animatedPath = checkPath.transform(matrix.storage);

        checkPaint.color = checkColor.withValues(alpha: progress.value);
        canvas.drawPath(animatedPath, checkPaint);
      } else {
        canvas.drawPath(checkPath, checkPaint);
      }
    }
  }

  @override
  bool shouldRepaint(_CheckboxPainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.borderColor != borderColor ||
        oldDelegate.checkColor != checkColor;
  }
}
