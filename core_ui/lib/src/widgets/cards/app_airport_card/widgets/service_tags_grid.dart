import 'package:core_ui/core_ui.dart';
import 'package:core_ui/src/widgets/cards/app_airport_card/widgets/service_tag_item.dart';
import 'package:domain/domain.dart';

class ServiceTagsGrid extends StatelessWidget {
  final List<AirportServiceTag> tags;
  final AppColorsTheme colors;

  const ServiceTagsGrid({super.key, required this.tags, required this.colors});

  static const double _dotSize = 8;

  @override
  Widget build(BuildContext context) {
    final List<Widget> rows = <Widget>[];
    for (int i = 0; i < tags.length; i += 2) {
      final AirportServiceTag left = tags[i];
      final AirportServiceTag? right = i + 1 < tags.length ? tags[i + 1] : null;

      rows.add(
        Padding(
          padding: EdgeInsets.only(bottom: i + 2 < tags.length ? 6 : 0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: ServiceTagItem(tag: left, dotSize: _dotSize, colors: colors),
              ),
              if (right != null)
                Expanded(
                  child: ServiceTagItem(tag: right, dotSize: _dotSize, colors: colors),
                ),
            ],
          ),
        ),
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: rows,
    );
  }
}
