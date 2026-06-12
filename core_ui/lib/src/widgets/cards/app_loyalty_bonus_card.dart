import 'package:core_ui/core_ui.dart';

/// Loyalty program card with scaled overlays for card ID and holder name.
class AppLoyaltyBonusCard extends StatefulWidget {
  static const double _aspectRatio = 1.59;

  final String cardImageUrl;
  final String? cardId;
  final String? firstName;
  final String? lastName;
  final bool _showOverlays;

  const AppLoyaltyBonusCard({
    super.key,
    required this.cardImageUrl,
    required this.cardId,
    this.firstName,
    this.lastName,
  }) : _showOverlays = true;

  const AppLoyaltyBonusCard.empty({super.key, required this.cardImageUrl})
    : cardId = null,
      firstName = null,
      lastName = null,
      _showOverlays = false;

  @override
  State<AppLoyaltyBonusCard> createState() => _AppLoyaltyBonusCardState();

  static String formatCardId(String rawCardId) {
    final String cleaned = rawCardId.replaceAll(RegExp(r'\s+'), '').toUpperCase();
    if (cleaned.isEmpty) return '';

    final StringBuffer buffer = StringBuffer();
    for (int index = 0; index < cleaned.length; index++) {
      if (index > 0 && index % 4 == 0) {
        buffer.write(' ');
      }
      buffer.write(cleaned[index]);
    }
    return buffer.toString();
  }

  static String formatHolderName({String? firstName, String? lastName}) {
    final List<String> parts = <String>[
      if (firstName != null && firstName.trim().isNotEmpty) firstName.trim(),
      if (lastName != null && lastName.trim().isNotEmpty) lastName.trim(),
    ];

    return parts.join(' ').toUpperCase();
  }
}

class _AppLoyaltyBonusCardState extends State<AppLoyaltyBonusCard>
    with SingleTickerProviderStateMixin {
  static const Duration _overlayFadeDuration = Duration(milliseconds: 200);

  late final AnimationController _overlayFadeController;
  late final Animation<double> _overlayFadeAnimation;
  bool _overlaysRevealed = false;

  @override
  void initState() {
    super.initState();
    _overlayFadeController = AnimationController(vsync: this, duration: _overlayFadeDuration);
    _overlayFadeAnimation = CurvedAnimation(parent: _overlayFadeController, curve: Curves.easeOut);
  }

  @override
  void didUpdateWidget(covariant AppLoyaltyBonusCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.cardImageUrl != widget.cardImageUrl) {
      _resetOverlays();
    }
  }

  @override
  void dispose() {
    _overlayFadeController.dispose();
    super.dispose();
  }

  void _resetOverlays() {
    _overlaysRevealed = false;
    _overlayFadeController.reset();
  }

  void _onImageReady() {
    if (_overlaysRevealed || !widget._showOverlays) {
      return;
    }

    _overlaysRevealed = true;
    _overlayFadeController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final String formattedCardId = widget._showOverlays
        ? AppLoyaltyBonusCard.formatCardId(widget.cardId ?? '')
        : '';
    final String holderName = widget._showOverlays
        ? AppLoyaltyBonusCard.formatHolderName(
            firstName: widget.firstName,
            lastName: widget.lastName,
          )
        : '';
    final bool hasOverlays =
        widget._showOverlays && (formattedCardId.isNotEmpty || holderName.isNotEmpty);

    return AspectRatio(
      aspectRatio: AppLoyaltyBonusCard._aspectRatio,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final double cardWidth = constraints.maxWidth;
          final double cardHeight = constraints.maxHeight;
          final double borderRadius = cardWidth * 0.035;
          final BorderRadius cardBorderRadius = BorderRadius.circular(borderRadius);

          return ClipRRect(
            borderRadius: cardBorderRadius,
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                AppNetworkImage(
                  imageUrl: widget.cardImageUrl,
                  fit: BoxFit.cover,
                  size: Size(cardWidth, cardHeight),
                  backgroundColor: Colors.transparent,
                  placeholderWidget: AppShimmer.rectangle(
                    width: cardWidth,
                    height: cardHeight,
                    borderRadius: cardBorderRadius,
                  ),
                  onImageReady: hasOverlays ? _onImageReady : null,
                ),
                if (hasOverlays)
                  Positioned.fill(
                    child: FadeTransition(
                      opacity: _overlayFadeAnimation,
                      child: Stack(
                        children: <Widget>[
                          if (formattedCardId.isNotEmpty)
                            Positioned(
                              left: cardWidth * 0.06,
                              right: cardWidth * 0.05,
                              bottom: cardHeight * 0.34,
                              child: _LoyaltyCardOverlayText(
                                text: formattedCardId,
                                cardWidth: cardWidth,
                                fontSizeFactor: 0.064,
                                letterSpacingFactor: 0.12,
                                alignment: Alignment.centerLeft,
                                textAlign: TextAlign.left,
                              ),
                            ),
                          if (holderName.isNotEmpty)
                            Positioned(
                              left: cardWidth * 0.06,
                              right: cardWidth * 0.3,
                              bottom: cardHeight * 0.22,
                              child: _LoyaltyCardOverlayText(
                                text: holderName,
                                cardWidth: cardWidth,
                                fontSizeFactor: 0.042,
                                alignment: Alignment.centerLeft,
                                textAlign: TextAlign.left,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _LoyaltyCardOverlayText extends StatelessWidget {
  static const Color _textOutlineColor = Color(0x99000000);

  final String text;
  final double cardWidth;
  final double fontSizeFactor;
  final double letterSpacingFactor;
  final Alignment alignment;
  final TextAlign textAlign;

  static List<Shadow> _textOutlineShadows(double fontSize) {
    final double stroke = (fontSize * 0.01375).clamp(0.125, 0.375);

    return <Offset>[
      Offset(-stroke, 0),
      Offset(stroke, 0),
      Offset(0, -stroke),
      Offset(0, stroke),
      Offset(-stroke, -stroke),
      Offset(stroke, -stroke),
      Offset(-stroke, stroke),
      Offset(stroke, stroke),
    ].map((Offset offset) => Shadow(color: _textOutlineColor, offset: offset)).toList();
  }

  const _LoyaltyCardOverlayText({
    required this.text,
    required this.cardWidth,
    required this.fontSizeFactor,
    this.letterSpacingFactor = 0.04,
    this.alignment = Alignment.center,
    this.textAlign = TextAlign.center,
  });

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.colors;
    final double fontSize = cardWidth * fontSizeFactor;

    return FittedBox(
      fit: BoxFit.scaleDown,
      alignment: alignment,
      child: Text(
        text,
        maxLines: 1,
        textAlign: textAlign,
        style: AppFonts.b4.copyWith(
          color: colors.text.white,
          fontSize: fontSize,
          fontWeight: FontWeight.w600,
          letterSpacing: fontSize * letterSpacingFactor,
          shadows: _textOutlineShadows(fontSize),
        ),
      ),
    );
  }
}
