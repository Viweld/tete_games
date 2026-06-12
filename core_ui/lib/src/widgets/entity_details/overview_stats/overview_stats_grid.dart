import 'package:core_ui/core_ui.dart';
import 'package:core_ui/src/widgets/entity_details/overview_stats/widgets/overview_stat_tile.dart';

class OverviewStatsGrid extends StatelessWidget {
  const OverviewStatsGrid({super.key, required this.items});

  final List<OverviewStatItem> items;

  static const double _rowSpacing = 24;
  static const double _columnSpacing = 16;

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return const SizedBox.shrink();
    }

    final List<Widget> rows = <Widget>[];
    for (int index = 0; index < items.length; index += 2) {
      final OverviewStatItem left = items[index];
      final OverviewStatItem? right = index + 1 < items.length ? items[index + 1] : null;

      rows.add(
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(child: OverviewStatTile(item: left)),
            const SizedBox(width: _columnSpacing),
            Expanded(
              child: right != null ? OverviewStatTile(item: right) : const SizedBox.shrink(),
            ),
          ],
        ),
      );

      if (index + 2 < items.length) {
        rows.add(const SizedBox(height: _rowSpacing));
      }
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: rows,
    );
  }
}
