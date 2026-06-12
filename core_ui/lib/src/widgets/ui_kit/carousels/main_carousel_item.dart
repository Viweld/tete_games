import 'package:core_ui/core_ui.dart';

class MainCarouselItem extends StatelessWidget {
  final String? imageUrl;
  final String title;
  final String? subtitle;
  final VoidCallback onTap;

  const MainCarouselItem({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.colors;

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 4,
        children: <Widget>[
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(6)),
              child: AppNetworkImage(
                imageUrl: imageUrl,
                size: const Size.fromWidth(double.maxFinite),
              ),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            title,
            style: AppFonts.b4.copyWith(color: colors.text.main),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          if (subtitle != null)
            Text(
              subtitle!,
              style: AppFonts.b2.copyWith(color: colors.text.secondary),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
        ],
      ),
    );
  }
}
