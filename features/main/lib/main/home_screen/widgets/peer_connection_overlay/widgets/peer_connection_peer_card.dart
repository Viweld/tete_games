import 'package:core_ui/core_ui.dart';

enum PeerConnectionPeerCardVisualState { normal, selected, waiting, faded }

class PeerConnectionPeerCard extends StatelessWidget {
  const PeerConnectionPeerCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.visualState,
    this.onTap,
    this.showsTrailingLoader = false,
  });

  static const double radius = 16;
  static const double selectedBorderWidth = 3;

  final String title;
  final String subtitle;
  final PeerConnectionPeerCardVisualState visualState;
  final VoidCallback? onTap;
  final bool showsTrailingLoader;

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.colors;
    final bool isSelected = visualState == PeerConnectionPeerCardVisualState.selected;
    final bool isWaiting = visualState == PeerConnectionPeerCardVisualState.waiting;
    final bool isFaded = visualState == PeerConnectionPeerCardVisualState.faded;

    final Color backgroundColor = isWaiting
        ? colors.background.accentOrange.withValues(alpha: 0.22)
        : colors.background.main;
    final Color borderColor = isSelected ? colors.borders.accentOrange : colors.borders.main;
    final double borderWidth = isSelected ? selectedBorderWidth : 1;
    final TextStyle titleStyle = AppFonts.b4.copyWith(color: colors.text.main);
    final TextStyle subtitleStyle = AppFonts.caption.copyWith(color: colors.text.secondary);

    final BorderRadius borderRadius = BorderRadius.circular(radius);

    final Widget cardContent = Opacity(
      opacity: isFaded ? 0.38 : 1,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: borderRadius,
          border: Border.all(color: borderColor, width: borderWidth),
          boxShadow: colors.cardShadows,
        ),
        child: Row(
          children: <Widget>[
            _PeerConnectionPeerCardLeadingIcon(colors: colors),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(title, style: titleStyle, maxLines: 1, overflow: TextOverflow.ellipsis),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: subtitleStyle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            if (showsTrailingLoader) ...<Widget>[
              const SizedBox(width: 12),
              AppSquareLoadingIndicator(size: 22, color: colors.text.accent),
            ],
          ],
        ),
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

class _PeerConnectionPeerCardLeadingIcon extends StatelessWidget {
  const _PeerConnectionPeerCardLeadingIcon({required this.colors});

  final AppColorsTheme colors;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: 40,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: colors.background.secondaryCard,
          shape: BoxShape.circle,
          border: Border.all(color: colors.borders.main),
        ),
        child: Icon(Icons.sensors, size: 22, color: colors.icons.main),
      ),
    );
  }
}
