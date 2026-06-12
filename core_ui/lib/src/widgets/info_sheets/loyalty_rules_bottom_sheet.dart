import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';

class LoyaltyRulesBottomSheet extends StatelessWidget {
  const LoyaltyRulesBottomSheet._();

  static Future<void> show(BuildContext context) {
    return AppBottomSheet.show(
      context,
      title: context.localization.loyalty_rules_title,
      contentBuilder: (BuildContext context) => const LoyaltyRulesBottomSheet._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.colors;
    final AppLocalization localization = context.localization;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          localization.loyalty_rules_main_text,
          style: AppFonts.b1.copyWith(color: colors.text.main),
        ),
        const SizedBox(height: 18),
        Text(
          localization.loyalty_rules_rate_text,
          style: AppFonts.h6.copyWith(color: colors.text.main),
        ),
        const SizedBox(height: 24),
        Text(
          localization.loyalty_rules_additional_conditions_title,
          style: AppFonts.h5.copyWith(color: colors.text.main),
        ),
        const SizedBox(height: 12),
        _BulletRow(text: localization.loyalty_rules_condition_1),
        const SizedBox(height: 8),
        _BulletRow(text: localization.loyalty_rules_condition_2),
        const SizedBox(height: 8),
        _BulletRow(text: localization.loyalty_rules_condition_3),
        const SizedBox(height: 24),
        Text(
          localization.loyalty_rules_important_title,
          style: AppFonts.h5.copyWith(color: colors.text.main),
        ),
        const SizedBox(height: 12),
        Text(
          localization.loyalty_rules_important_text,
          style: AppFonts.b1.copyWith(color: colors.text.main),
        ),
      ],
    );
  }
}

class _BulletRow extends StatelessWidget {
  final String text;

  const _BulletRow({required this.text});

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.colors;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 8, right: 8),
          child: Container(
            width: 4,
            height: 4,
            decoration: BoxDecoration(color: colors.text.main, shape: BoxShape.circle),
          ),
        ),
        Expanded(
          child: Text(text, style: AppFonts.b1.copyWith(color: colors.text.main)),
        ),
      ],
    );
  }
}
