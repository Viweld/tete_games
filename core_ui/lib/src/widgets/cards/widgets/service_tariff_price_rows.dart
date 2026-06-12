import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/src/widgets/cards/widgets/app_price_row.dart';
import 'package:domain/domain.dart';

/// Service price breakdown by passenger type for [AppTariffCard].
///
/// When [Service.prices] is set, renders adult / child / infant rows and an
/// optional "from" total. Otherwise shows description and "from" price via
/// [Service.displayPrice].
class ServiceTariffPriceRows extends StatelessWidget {
  final Service service;

  const ServiceTariffPriceRows({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    final AppLocalization localization = context.localization;
    final ServicePrice? regularPrice = service.prices.firstOrNull;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        if (regularPrice == null) ...<Widget>[
          if ((service.description ?? '').isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: AppHtmlContent(html: service.description ?? ''),
            ),
          if (service.displayPrice != null)
            AppPriceRow(
              label: localization.airport_detail_price_transfer_from,
              price: service.displayPrice!.amount,
              currency: service.displayPrice!.currency,
              prefix: localization.airport_detail_from,
            ),
        ],
        if (regularPrice != null) ...<Widget>[
          AppPriceRow(
            label: localization.airport_detail_tariff_adults,
            price: regularPrice.adultPrice,
            currency: regularPrice.currency,
            suffix: localization.airport_detail_tariff_per_person,
          ),
          const SizedBox(height: 4),
          AppPriceRow(
            label: localization.airport_detail_tariff_children,
            price: regularPrice.childPrice,
            currency: regularPrice.currency,
            suffix: localization.airport_detail_tariff_per_child,
          ),
          const SizedBox(height: 4),
          AppPriceRow(
            label: localization.airport_detail_tariff_infants,
            price: regularPrice.infantPrice,
            currency: regularPrice.currency,
            isFreeText: localization.airport_detail_free,
          ),
          if (service.displayPrice != null) ...<Widget>[
            const SizedBox(height: 4),
            AppPriceRow(
              label: localization.airport_detail_price_from,
              price: service.displayPrice!.amount,
              currency: service.displayPrice!.currency,
              prefix: localization.airport_detail_from,
            ),
          ],
        ],
      ],
    );
  }
}
