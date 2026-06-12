import 'package:core_ui/core_ui.dart';
import 'package:core_ui/src/widgets/cards/app_airport_card/widgets/iata_badge.dart';
import 'package:core_ui/src/widgets/cards/app_airport_card/widgets/service_tags_grid.dart';
import 'package:domain/domain.dart';

class AppAirportCard extends StatelessWidget {
  final Airport airport;
  final VoidCallback onTap;

  const AppAirportCard({super.key, required this.airport, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.colors;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: colors.background.main,
          borderRadius: const BorderRadius.all(Radius.circular(6)),
          boxShadow: colors.cardShadows,
        ),
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 14,
          children: <Widget>[
            Row(
              spacing: 14,
              children: <Widget>[
                IataBadge(iataCode: airport.iataCode),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      airport.name,
                      style: AppFonts.b3.copyWith(color: colors.text.main),
                      textAlign: TextAlign.right,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                if (airport.photo?.medium != null) ...<Widget>[
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(6)),
                    child: SizedBox(
                      width: 120,
                      height: 120,
                      child: AppNetworkImage(
                        imageUrl: airport.photo?.medium,
                        size: const Size(120, 120),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                ],
                Expanded(
                  child: SizedBox(
                    height: airport.photo?.medium != null ? 120 : null,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        if (airport.cityName?.isNotEmpty == true)
                          Text(
                            airport.cityName!,
                            style: AppFonts.b1.copyWith(color: colors.text.main),
                            overflow: TextOverflow.ellipsis,
                          ),
                        if (airport.countryName?.isNotEmpty == true) ...<Widget>[
                          const SizedBox(height: 2),
                          Text(
                            airport.countryName!,
                            style: AppFonts.b2.copyWith(color: colors.text.secondary),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                        if (airport.tags.isNotEmpty) ...<Widget>[
                          if (airport.photo?.medium != null) const Spacer(),
                          const SizedBox(height: 14),
                          ServiceTagsGrid(tags: airport.tags, colors: colors),
                        ],
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
