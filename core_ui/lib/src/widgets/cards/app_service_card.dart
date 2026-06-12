import 'package:core_ui/core_ui.dart';

class AppServiceCard extends StatelessWidget {
  final VoidCallback onTap;
  final String? imageUrl;
  final Widget body;
  final Widget? footer;
  final Widget? imageInterlayer;
  final double paddings;

  const AppServiceCard({
    super.key,
    required this.onTap,
    required this.imageUrl,
    required this.body,
    this.footer,
    this.imageInterlayer,
    this.paddings = 14,
  });

  static const double _imageAspectRatio = 3 / 2;
  static const double _radius = 20;
  static const double _borderWeight = 1;

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.colors;
    const BorderRadius borderRadius = BorderRadius.all(Radius.circular(_radius));
    const BorderRadius imageBorderRadiusTop = BorderRadius.vertical(
      top: Radius.circular(_radius - _borderWeight),
    );

    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: colors.background.secondaryCard,
            borderRadius: borderRadius,
            border: Border.all(color: colors.borders.main, width: _borderWeight),
            boxShadow: colors.dialogShadows,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ClipRRect(
                borderRadius: imageBorderRadiusTop,
                child: AspectRatio(
                  aspectRatio: _imageAspectRatio,
                  child: Stack(
                    children: <Widget>[
                      Positioned.fill(
                        child: AppNetworkImage(imageUrl: imageUrl, fit: BoxFit.cover),
                      ),
                      if (imageInterlayer != null)
                        Positioned.fill(
                          child: Padding(
                            padding: EdgeInsets.all(paddings),
                            child: Align(alignment: Alignment.topLeft, child: imageInterlayer),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.all(paddings), child: body),
              if (footer != null) ...<Widget>[
                AppDivider(horizontalIndents: paddings),
                Padding(padding: EdgeInsets.all(paddings), child: footer),
              ],
            ],
          ),
        ),
        Positioned.fill(
          child: Material(
            borderRadius: borderRadius,
            color: Colors.transparent,
            child: InkWell(borderRadius: borderRadius, onTap: onTap),
          ),
        ),
      ],
    );
  }
}
