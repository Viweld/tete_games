import 'package:core_ui/core_ui.dart';

/// A tappable tile that combines [AppCheckbox] with a text label.
///
/// The entire tile area is tappable and shows a ripple effect.
/// The embedded [AppCheckbox] only reflects the checked state and
/// does not handle its own taps (uses absorbPointer).
///
/// Use [compact] to control the layout:
/// - `true`  — the tile wraps its content (checkbox + text side by side).
/// - `false` — the text expands to fill all available horizontal space.
class AppCheckboxTile extends StatelessWidget {
  final bool value;
  final String text;
  final ValueChanged<bool> onChanged;
  final bool compact;
  final bool enabled;
  final bool hasError;
  final TextStyle? textStyle;

  const AppCheckboxTile({
    super.key,
    required this.value,
    required this.text,
    required this.onChanged,
    this.compact = true,
    this.enabled = true,
    this.hasError = false,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.colors;

    final Widget checkbox = AppCheckbox(
      value: value,
      onChanged: onChanged,
      enabled: enabled,
      hasError: hasError,
      absorbPointer: true,
    );

    final Widget label = Text(
      text,
      style:
          textStyle?.copyWith(color: enabled ? colors.text.main : colors.text.disabled) ??
          AppFonts.caption.copyWith(color: enabled ? colors.text.main : colors.text.disabled),
    );

    final Widget row = Row(
      mainAxisSize: compact ? MainAxisSize.min : MainAxisSize.max,
      children: <Widget>[
        checkbox,
        const SizedBox(width: 6),
        compact ? label : Expanded(child: label),
        const SizedBox(width: 10),
      ],
    );

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: enabled ? () => onChanged(!value) : null,
        borderRadius: BorderRadius.circular(8),
        child: row,
      ),
    );
  }
}
