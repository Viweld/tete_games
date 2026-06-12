import 'package:core_ui/core_ui.dart';

class OverviewStatTile extends StatelessWidget {
  const OverviewStatTile({super.key, required this.item});

  final OverviewStatItem item;

  static const double _iconBoxSize = 44;
  static const BorderRadius _iconBorderRadius = BorderRadius.all(Radius.circular(12));

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.colors;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: _iconBoxSize,
          height: _iconBoxSize,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: colors.background.secondaryCard,
            borderRadius: _iconBorderRadius,
            border: Border.all(color: colors.borders.main),
          ),
          child: item.icon.call(size: 24, color: colors.icons.main),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 4,
            children: <Widget>[
              Text(item.label, style: AppFonts.caption.copyWith(color: colors.text.secondary)),
              Text(
                item.value,
                style: AppFonts.h6.copyWith(color: colors.text.main),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
