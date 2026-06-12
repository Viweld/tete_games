part of 'toggle.dart';

class AppToggle<T> extends StatefulWidget {
  final List<ToggleItem<T>> items;
  final T? initialValue;
  final ValueChanged<T>? onChanged;

  const AppToggle({required this.items, this.initialValue, this.onChanged, super.key});

  static const double height = 46;

  @override
  State<AppToggle<T>> createState() => _AppToggleState<T>();
}

class _AppToggleState<T> extends State<AppToggle<T>> {
  static const Duration _duration = Duration(milliseconds: 200);

  late T _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.initialValue ?? widget.items.first.value;
  }

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.colors;

    return Container(
      height: AppToggle.height,
      decoration: BoxDecoration(
        color: colors.background.secondaryCard,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      padding: const EdgeInsets.all(2),
      child: Row(
        children: widget.items.map((ToggleItem<T> option) {
          final bool isSelected = _selectedValue == option.value;

          return Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() => _selectedValue = option.value);
                widget.onChanged?.call(option.value);
              },
              child: AnimatedContainer(
                duration: _duration,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isSelected ? colors.background.main : colors.background.secondaryCard,
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  border: Border.all(
                    color: isSelected ? colors.unknown : colors.background.secondaryCard,
                  ),
                ),
                child: Text(
                  option.label,
                  style: AppFonts.h3.copyWith(
                    color: isSelected ? colors.text.main : colors.text.secondary,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
