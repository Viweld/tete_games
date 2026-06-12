import 'package:core_ui/core_ui.dart';

class AppRadio extends StatelessWidget {
  final bool isSelected;
  final bool isEnabled;
  final ValueChanged<bool>? onChanged;

  const AppRadio({super.key, required this.isSelected, this.isEnabled = true, this.onChanged});

  static const double _diameter = 20;
  static const double _tapAreaSize = 40;

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.colors;

    final Color radioColor = isEnabled ? colors.radio.enabled : colors.radio.disabled;

    return SizedBox.square(
      dimension: _tapAreaSize,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: isEnabled ? () => onChanged?.call(!isSelected) : null,
          customBorder: const CircleBorder(),
          child: Center(
            child: Container(
              width: _diameter,
              height: _diameter,
              decoration: BoxDecoration(
                color: Colors.transparent,
                shape: BoxShape.circle,
                border: Border.all(color: radioColor, width: 2),
              ),
              child: Center(
                child: AnimatedContainer(
                  duration: AppDimens.defaultAnimationDuration,
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: isSelected ? radioColor : Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
