import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/src/widgets/cards/widgets/app_price_row.dart';
import 'package:domain/domain.dart';

class AppVipLoungeCard extends StatelessWidget {
  final Service service;
  final VoidCallback onWatchPhotoTap;
  final VoidCallback onSelectTap;

  const AppVipLoungeCard({
    super.key,
    required this.service,
    required this.onWatchPhotoTap,
    required this.onSelectTap,
  });

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.colors;
    final AppLocalization localization = context.localization;

    return Container(
      decoration: BoxDecoration(
        border: Border(left: BorderSide(color: colors.icons.accent, width: 10)),
        color: colors.background.main,
        borderRadius: BorderRadius.circular(6),
        boxShadow: colors.cardShadows,
      ),
      padding: const EdgeInsets.fromLTRB(22, 14, 32, 14),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          if ((service.description ?? '').isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: AppHtmlContent(html: service.description ?? ''),
            ),
          if (service.displayPrice != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: AppPriceRow(
                label: localization.vip_lounge_card_price_label,
                price: service.displayPrice!.amount,
                currency: service.displayPrice!.currency,
                prefix: localization.vip_lounge_card_price_prefix,
              ),
            ),
          if (service.images.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Stack(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      AspectRatio(
                        aspectRatio: 268 / 110,
                        child: AppNetworkImage(imageUrl: service.images.first.medium),
                      ),
                      SizedBox(
                        height: 40,
                        child: Center(
                          child: Text(
                            localization.vip_lounge_card_watch_all_photos,
                            style: AppFonts.caption.copyWith(color: colors.text.main),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned.fill(
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(onTap: onWatchPhotoTap),
                    ),
                  ),
                ],
              ),
            ),
          AppElevatedButton(
            title: localization.vip_lounge_card_select_button(service.marketingName ?? ''),
            onTap: onSelectTap,
          ),
        ],
      ),
    );
  }
}
