import 'package:core_ui/core_ui.dart';

enum AppBadgeStatus { success, accent, error, warning, neutral, blue }

class AppBadge extends StatelessWidget {
  final String text;
  final AppBadgeStatus status;
  final Widget? icon;
  final bool showIcon;

  const AppBadge({
    super.key,
    required this.text,
    this.status = AppBadgeStatus.accent,
    this.icon,
    this.showIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.colors;
    final _BadgeColors badgeColors = _getBadgeColors(colors);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
      decoration: BoxDecoration(
        color: badgeColors.background,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          if (showIcon && icon != null) ...<Widget>[icon!, const SizedBox(width: 8)],
          Flexible(
            child: Text(text, style: AppFonts.b4.copyWith(color: badgeColors.text)),
          ),
        ],
      ),
    );
  }

  _BadgeColors _getBadgeColors(AppColorsTheme colors) {
    return switch (status) {
      AppBadgeStatus.success => _BadgeColors(
        background: colors.icons.success,
        text: colors.elevatedButton.contentDefault.main,
      ),
      AppBadgeStatus.accent => _BadgeColors(
        background: colors.icons.accent,
        text: colors.elevatedButton.contentDefault.main,
      ),
      AppBadgeStatus.error => _BadgeColors(
        background: colors.textField.borderError,
        text: colors.elevatedButton.contentDefault.main,
      ),
      AppBadgeStatus.warning => _BadgeColors(
        background: AppColors.actWarning,
        text: colors.elevatedButton.contentDefault.main,
      ),
      AppBadgeStatus.neutral => _BadgeColors(
        background: colors.background.secondaryCard,
        text: colors.text.main,
      ),
      AppBadgeStatus.blue => _BadgeColors(
        background: colors.background.infoBlue,
        text: colors.elevatedButton.contentDefault.main,
      ),
    };
  }
}

class _BadgeColors {
  final Color background;
  final Color text;

  const _BadgeColors({required this.background, required this.text});
}
