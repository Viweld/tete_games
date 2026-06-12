import 'package:core_ui/core_ui.dart';

class AppAccordionItem {
  final String title;
  final Widget content;
  final Widget? icon;
  final Color? borderColor;

  const AppAccordionItem({required this.title, required this.content, this.icon, this.borderColor});
}

class AppAccordion extends StatefulWidget {
  final List<AppAccordionItem> items;
  final int? initialExpandedIndex;
  final bool allowMultipleExpanded;

  const AppAccordion({
    super.key,
    required this.items,
    this.initialExpandedIndex,
    this.allowMultipleExpanded = false,
  });

  @override
  State<AppAccordion> createState() => _AppAccordionState();
}

class _AppAccordionState extends State<AppAccordion> {
  late Set<int> _expandedIndices;

  @override
  void initState() {
    super.initState();
    _expandedIndices = widget.initialExpandedIndex != null
        ? <int>{widget.initialExpandedIndex!}
        : <int>{};
  }

  void _toggleItem(int index) {
    setState(() {
      if (_expandedIndices.contains(index)) {
        _expandedIndices.remove(index);
      } else {
        if (!widget.allowMultipleExpanded) {
          _expandedIndices.clear();
        }
        _expandedIndices.add(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: List<Widget>.generate(
        widget.items.length,
        (int index) => _AccordionItemWidget(
          item: widget.items[index],
          isExpanded: _expandedIndices.contains(index),
          onTap: () => _toggleItem(index),
        ),
      ),
    );
  }
}

class _AccordionItemWidget extends StatelessWidget {
  final AppAccordionItem item;
  final bool isExpanded;
  final VoidCallback onTap;

  const _AccordionItemWidget({required this.item, required this.isExpanded, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.colors;
    final Color borderColor = item.borderColor ?? colors.borders.main;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.only(right: 12),
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: borderColor)),
              ),
              child: ConstrainedBox(
                constraints: const BoxConstraints(minHeight: 40),
                child: Row(
                  children: <Widget>[
                    if (item.icon != null) ...<Widget>[item.icon!, const SizedBox(width: 8)],
                    Expanded(
                      child: Text(item.title, style: AppFonts.b2.copyWith(color: colors.text.main)),
                    ),
                    Icon(
                      isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                      size: 24,
                      color: colors.icons.main,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        AnimatedCrossFade(
          firstChild: const SizedBox.shrink(),
          secondChild: Padding(padding: const EdgeInsets.all(14), child: item.content),
          crossFadeState: isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
          duration: const Duration(milliseconds: 200),
        ),
      ],
    );
  }
}
