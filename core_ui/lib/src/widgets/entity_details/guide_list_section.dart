import 'package:core_ui/core_ui.dart';

class GuideListSection extends StatelessWidget {
  const GuideListSection({
    super.key,
    required this.title,
    required this.items,
    required this.iconData,
    this.iconColor,
  });

  final String title;
  final List<String> items;
  final IconData iconData;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return const SizedBox.shrink();
    }

    final AppColorsTheme colors = context.colors;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 12,
      children: <Widget>[
        Text(title, style: AppFonts.h5.copyWith(color: colors.text.main)),
        ...items.map(
          (String item) => Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8,
            children: <Widget>[
              Icon(iconData, size: 18, color: iconColor ?? colors.icons.accent),
              Expanded(
                child: Text(item, style: AppFonts.b2.copyWith(color: colors.text.main)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
