import 'package:core_ui/core_ui.dart';

class DrawerTile extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Widget? leading;
  final bool isReady;
  final VoidCallback onTap;

  const DrawerTile({
    super.key,
    required this.title,
    this.subtitle,
    required this.leading,
    required this.isReady,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.colors;

    return Stack(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 12,
            children: <Widget>[
              ?leading,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text(title, style: AppFonts.b3.copyWith(color: colors.text.main)),
                    ),
                    if (subtitle != null)
                      Text(
                        subtitle!,
                        style: AppFonts.caption.copyWith(color: colors.text.secondary),
                      ),
                  ],
                ),
              ),
              if (isReady)
                AppIcons.checkboxChecked.call(size: 32)
              else
                AppIcons.checkboxEmpty.call(size: 32),
            ],
          ),
        ),

        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            child: InkWell(onTap: onTap),
          ),
        ),
      ],
    );
  }
}
