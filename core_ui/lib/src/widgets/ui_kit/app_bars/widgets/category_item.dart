import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';

class CategoryItem extends StatelessWidget {
  final ServiceCategory category;
  final VoidCallback onTap;
  final bool isSelected;

  const CategoryItem({
    super.key,
    required this.category,
    required this.onTap,
    required this.isSelected,
  });

  static const double height = 36;

  @override
  Widget build(BuildContext context) {
    const BorderRadius borderRadius = BorderRadius.all(Radius.circular(height * 0.5));
    final AppLocalization localization = context.localization;
    final AppColorsTheme colors = context.colors;

    return Material(
      color: Colors.transparent,
      borderRadius: borderRadius,
      child: InkWell(
        onTap: onTap,
        borderRadius: borderRadius,
        child: Ink(
          height: height,
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            border: Border.all(
              color: isSelected ? colors.borders.accentOrange : colors.appBar.background,
              width: 2,
            ),
            color: isSelected
                ? colors.elevatedButton.backgroundDefault.main
                : colors.appBar.background,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 8,
              children: <Widget>[
                _getCategoryIcon(category).call(size: 20, color: colors.appBar.icon),
                Text(
                  _getCategoryTitle(category, localization),
                  style: AppFonts.label.copyWith(color: colors.appBar.text),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppIcon _getCategoryIcon(ServiceCategory category) => switch (category) {
    ServiceCategory.airportServices => AppIcons.appBarServices,
    ServiceCategory.transfer => AppIcons.appBarTransfer,
    ServiceCategory.privateJet => AppIcons.jetOutlined,
    // TODO(Vadim): temp locked until promo screen is ready
    // ServiceCategory.promo => AppIcons.starLarge,
  };

  String _getCategoryTitle(ServiceCategory category, AppLocalization localization) =>
      switch (category) {
        ServiceCategory.airportServices => localization.service_category_airport_title,
        ServiceCategory.transfer => localization.service_category_transfer_title,
        ServiceCategory.privateJet => localization.service_category_private_jet_title,
        // TODO(Vadim): temp locked until promo screen is ready
        // ServiceCategory.promo => localization.service_category_promo_title,
      };
}
