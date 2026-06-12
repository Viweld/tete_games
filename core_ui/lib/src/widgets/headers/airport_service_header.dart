part of 'headers.dart';

class AirportServiceHeader extends StatelessWidget {
  final String cityName;
  final String iataCode;
  final String subtitle;
  final Widget icon;
  final String? airportName;
  final String? airportDescription;

  const AirportServiceHeader({
    super.key,
    required this.cityName,
    required this.iataCode,
    required this.subtitle,
    required this.icon,
    this.airportName,
    this.airportDescription,
  });

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.colors;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 4,
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            InkWell(
              onTap: () => AppBottomSheet.show(
                context,
                title: '$airportName',
                contentBuilder: (_) => AppHtmlContent(
                  html: airportDescription ?? '',
                  style: AppFonts.b1.copyWith(color: colors.text.main),
                ),
              ),
              child: icon,
            ),
            Flexible(
              flex: 2,
              child: Text(cityName, style: AppFonts.h4.copyWith(color: colors.text.main)),
            ),
            const Spacer(),
            if (iataCode.isNotEmpty) AppBadge(text: iataCode),
          ],
        ),
        Text(
          subtitle,
          style: AppFonts.b2.copyWith(color: colors.text.secondary),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
