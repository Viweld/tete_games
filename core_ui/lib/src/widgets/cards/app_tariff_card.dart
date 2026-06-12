import 'package:core_ui/core_ui.dart';

/// Generic tariff card shell (left accent border, shadow, rounded corners)
/// with slots for arbitrary content.
///
/// Slots stack top to bottom: [header] (badges, title, description),
/// then [priceRows], then [footer] (e.g. a button).
/// 12px gap between blocks; [rowSpacing] between adjacent [priceRows].
///
/// In a height-constrained layout (e.g. equal-height carousel cards) content
/// scrolls; otherwise it sizes to its children.
class AppTariffCard extends StatelessWidget {
  final Widget? header;
  final List<Widget> priceRows;
  final Widget? footer;
  final Color? accentColor;
  final double rowSpacing;

  const AppTariffCard({
    super.key,
    this.header,
    this.priceRows = const <Widget>[],
    this.footer,
    this.accentColor,
    this.rowSpacing = 12,
  });

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.colors;
    final Color accent = accentColor ?? colors.icons.accent;

    return Container(
      decoration: BoxDecoration(
        color: colors.background.main,
        borderRadius: BorderRadius.circular(6),
        border: Border(left: BorderSide(color: accent, width: 10)),
        boxShadow: colors.cardShadows,
      ),
      padding: const EdgeInsets.fromLTRB(22, 14, 32, 14),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final List<Widget> children = <Widget>[];

          if (header != null) {
            children.add(header!);
          }

          for (int index = 0; index < priceRows.length; index++) {
            if (children.isNotEmpty) {
              children.add(SizedBox(height: index == 0 ? 12 : rowSpacing));
            }
            children.add(priceRows[index]);
          }

          if (footer != null) {
            if (children.isNotEmpty) {
              children.add(const SizedBox(height: 12));
            }
            children.add(footer!);
          }

          final Widget content = Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: children,
          );

          if (!constraints.hasBoundedHeight) {
            return content;
          }

          return SingleChildScrollView(physics: const ClampingScrollPhysics(), child: content);
        },
      ),
    );
  }
}
