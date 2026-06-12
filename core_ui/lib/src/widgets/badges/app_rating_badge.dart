import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';

class AppRatingBadge extends StatelessWidget {
  const AppRatingBadge({super.key, required this.rating});

  final double rating;

  static String ratingText(BuildContext context, double rating) {
    final double value = rating.clamp(0, 10);
    final AppLocalization l10n = context.localization;

    if (value < 2) return l10n.rating_badge_terrible;
    if (value < 4) return l10n.rating_badge_bad;
    if (value < 6) return l10n.rating_badge_normal;
    if (value < 8) return l10n.rating_badge_good;
    return l10n.rating_badge_excellent;
  }

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.colors;
    final AppRatingBadgeTheme ratingBadgeColors = colors.ratingBadge;
    final double value = rating.clamp(0, 10);

    final Color background = switch (value) {
      < 2 => ratingBadgeColors.terrible,
      < 4 => ratingBadgeColors.bad,
      < 6 => ratingBadgeColors.normal,
      < 8 => ratingBadgeColors.good,
      _ => ratingBadgeColors.excellent,
    };

    return Container(
      padding: const EdgeInsets.fromLTRB(7, 4, 8, 4),
      decoration: BoxDecoration(
        color: background,
        borderRadius: const BorderRadius.all(Radius.circular(6)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 6,
        children: <Widget>[
          Transform.translate(
            offset: const Offset(0, -0.5),
            child: Icon(Icons.star_rounded, size: 18, color: colors.icons.white),
          ),
          Text(rating.toStringAsFixed(1), style: AppFonts.h6.copyWith(color: colors.text.white)),
        ],
      ),
    );
  }
}
