import 'package:core_ui/core_ui.dart';

class AppCounterField extends StatelessWidget {
  final String label;
  final int value;
  final ValueChanged<int> onChanged;
  final int min;
  final int? max;
  final String? hint;

  const AppCounterField({
    required this.label,
    required this.value,
    required this.onChanged,
    this.min = 0,
    this.max,
    this.hint,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.colors;

    final bool canDecrement = value > min;
    final bool canIncrement = max == null || value < max!;

    final bool hasValue = value > min;

    final Color iconColorDecrement = canDecrement ? colors.icons.main : colors.text.disabled;
    final Color iconColorIncrement = canIncrement ? colors.icons.main : colors.text.disabled;

    final Color valueTextColor = hasValue ? colors.text.main : colors.text.disabled;

    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: AppFonts.label.copyWith(color: colors.text.main),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 14),
          SizedBox(
            width: 40,
            height: 40,
            child: Center(
              child: AppIcons.minus(
                color: iconColorDecrement,
                size: 24,
                onTap: canDecrement ? () => onChanged(value - 1) : null,
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                color: colors.textField.background,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: colors.textField.border),
              ),
              alignment: Alignment.center,
              child: Text(
                hasValue ? value.toString() : (hint ?? value.toString()),
                style: AppFonts.b1.copyWith(color: valueTextColor),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(width: 14),
          SizedBox(
            width: 40,
            height: 40,
            child: Center(
              child: AppIcons.plus(
                color: iconColorIncrement,
                size: 24,
                onTap: canIncrement ? () => onChanged(value + 1) : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
