import 'package:core_ui/core_ui.dart';

/// A tappable tile that combines [AppRadio] with a text label,
/// plus an optional non-tappable hint text below.
///
/// The entire tile row is tappable (shows a ripple effect).
/// The embedded [AppRadio] only reflects the selected state and
/// does not handle its own taps (uses [AbsorbPointer]).
///
/// The optional [hint] text is rendered below the tile and is not tappable.
///
/// Tile + hint together form a standalone reusable selection widget.
class AppRadioTile extends StatelessWidget {
  /// Main label shown next to the radio indicator.
  final String label;

  /// Optional explanatory text rendered below the clickable tile.
  /// Not tappable.
  final String? hint;

  /// Whether this option is currently selected.
  final bool isSelected;

  /// Whether the tile is enabled for interaction.
  final bool isEnabled;

  /// Called when the tile is tapped.
  final ValueChanged<bool>? onChanged;

  const AppRadioTile({
    super.key,
    required this.label,
    this.hint,
    required this.isSelected,
    this.isEnabled = true,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.colors;

    final Widget radioIndicator = AbsorbPointer(
      child: AppRadio(isSelected: isSelected, isEnabled: isEnabled),
    );

    final Widget labelText = Text(
      label,
      style: AppFonts.caption.copyWith(color: isEnabled ? colors.text.main : colors.text.disabled),
    );

    final Widget tileRow = Row(
      children: <Widget>[
        radioIndicator,
        const SizedBox(width: 6),
        Expanded(child: labelText),
      ],
    );

    final Widget tappableTile = Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: isEnabled ? () => onChanged?.call(!isSelected) : null,
        borderRadius: BorderRadius.circular(8),
        child: tileRow,
      ),
    );

    if (hint == null) return tappableTile;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        tappableTile,
        const SizedBox(height: 4),
        Padding(
          padding: const EdgeInsets.only(left: 4),
          child: Text(hint!, style: AppFonts.caption.copyWith(color: colors.text.secondary)),
        ),
      ],
    );
  }
}
