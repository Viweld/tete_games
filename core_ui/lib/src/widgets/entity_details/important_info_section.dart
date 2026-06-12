import 'package:core_ui/core_ui.dart';

class ImportantInfoSection extends StatelessWidget {
  const ImportantInfoSection({super.key, required this.title, required this.items});

  final String title;
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return const SizedBox.shrink();
    }

    final AppColorsTheme colors = context.colors;

    return AppCard(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8,
        children: <Widget>[
          Text(title, style: AppFonts.h5.copyWith(color: colors.text.main)),
          ...items.map(
            (String item) => Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 6,
              children: <Widget>[
                SizedBox(
                  height: (AppFonts.b2.height ?? 0) * (AppFonts.b2.fontSize ?? 0),
                  child: Center(child: Icon(Icons.circle, size: 6, color: colors.text.main)),
                ),
                Expanded(
                  child: Text(item, style: AppFonts.b2.copyWith(color: colors.text.main)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
