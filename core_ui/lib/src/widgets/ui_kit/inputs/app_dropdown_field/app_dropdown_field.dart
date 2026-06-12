import 'package:core_ui/core_ui.dart';

class DropdownOption<T> {
  final String label;
  final T value;
  final Widget? prefix;

  const DropdownOption({required this.label, required this.value, this.prefix});
}

class AppDropdownField<T> extends StatelessWidget {
  final String? label;
  final String? hint;
  final T? selectedValue;
  final List<DropdownOption<T>> options;
  final ValueChanged<T> onChanged;
  final FieldState state;
  final Widget? prefix;

  const AppDropdownField({
    super.key,
    this.label,
    this.hint,
    this.selectedValue,
    required this.options,
    required this.onChanged,
    this.state = FieldState.enabled,
    this.prefix,
  });

  @override
  Widget build(BuildContext context) {
    final DropdownOption<T>? selectedOption = options
        .where((DropdownOption<T> o) => o.value == selectedValue)
        .firstOrNull;
    final String displayText = selectedOption?.label ?? '';

    return AppTextField(
      label: label,
      hint: hint,
      initialText: displayText,
      readOnly: true,
      state: state,
      prefix: prefix ?? selectedOption?.prefix,
      postfixes: <Widget>[
        Icon(Icons.keyboard_arrow_down, size: 24, color: context.colors.icons.main),
      ],
      suggestions: options.map((DropdownOption<T> option) {
        return TextFieldItem(
          label: option.label,
          prefix: option.prefix,
          onTap: () => onChanged(option.value),
        );
      }).toList(),
    );
  }
}
