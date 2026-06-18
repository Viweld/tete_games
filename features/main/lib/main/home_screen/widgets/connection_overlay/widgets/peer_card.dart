import 'package:core_ui/core_ui.dart';

enum PeerCardVisualState { normal, selected, waiting, faded }

class PeerCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final PeerCardVisualState visualState;
  final AppIcon? leadingIcon;
  final VoidCallback? onTap;
  final bool showsTrailingLoader;
  final bool reserveTrailingSpace;

  const PeerCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.visualState,
    this.leadingIcon,
    this.onTap,
    this.showsTrailingLoader = false,
    this.reserveTrailingSpace = false,
  });

  static const double radius = 20;
  static const double selectedBorderWidth = 3;
  static const double trailingSlotWidth = 50;

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.colors;
    final bool isSelected = visualState == PeerCardVisualState.selected;
    final bool isWaiting = visualState == PeerCardVisualState.waiting;
    final bool isFaded = visualState == PeerCardVisualState.faded;
    final bool hasAccentBorder = isSelected || isWaiting;

    final Color backgroundColor = isFaded
        ? colors.background.secondaryCard
        : colors.background.main;
    final Color titleColor = isFaded ? colors.text.secondary : colors.text.main;
    final Color subtitleColor = isFaded ? colors.text.secondary : colors.text.secondary;
    final TextStyle titleStyle = AppFonts.h4.copyWith(color: titleColor);
    final TextStyle subtitleStyle = AppFonts.caption.copyWith(color: subtitleColor);
    final AppIcon resolvedLeadingIcon = leadingIcon ?? AppIcons.host;

    final BorderRadius borderRadius = BorderRadius.circular(radius);
    final bool showsTrailingSlot = reserveTrailingSpace || showsTrailingLoader;

    final Widget cardContent = Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius,
        border: Border.all(
          color: hasAccentBorder ? colors.borders.accentOrange : Colors.transparent,
          width: selectedBorderWidth,
        ),
        boxShadow: isFaded ? null : colors.cardShadows,
      ),
      child: Row(
        children: <Widget>[
          resolvedLeadingIcon.call(
            size: 64,
            color: isFaded ? colors.icons.disabled : colors.icons.main,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 8,
              children: <Widget>[
                Text(title, style: titleStyle, maxLines: 1, overflow: TextOverflow.ellipsis),
                Text(subtitle, style: subtitleStyle, maxLines: 1, overflow: TextOverflow.ellipsis),
              ],
            ),
          ),
          if (showsTrailingSlot) ...<Widget>[
            const SizedBox(width: 12),
            SizedBox(
              width: trailingSlotWidth,
              child: showsTrailingLoader
                  ? Center(child: AppSquareLoadingIndicator(size: 50, color: colors.text.accent))
                  : const SizedBox.shrink(),
            ),
          ],
        ],
      ),
    );

    if (onTap == null) return cardContent;

    return Stack(
      children: <Widget>[
        cardContent,
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            borderRadius: borderRadius,
            clipBehavior: Clip.antiAlias,
            child: InkWell(borderRadius: borderRadius, onTap: onTap),
          ),
        ),
      ],
    );
  }
}
