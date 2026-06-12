import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';

/// A widget that displays expandable and collapsible text content.
class ExpandableText extends StatefulWidget {
  /// The text content to be displayed.
  final String text;

  /// The number of lines to show when the text is collapsed.
  final int collapsedLines;

  const ExpandableText({super.key, required this.text, this.collapsedLines = 2});

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> with SingleTickerProviderStateMixin {
  bool _expanded = false;

  void _toggle() => setState(() => _expanded = !_expanded);

  bool _isOverflowing({
    required String text,
    required TextStyle style,
    required double maxWidth,
    required int maxLines,
  }) {
    final TextPainter painter = TextPainter(
      text: TextSpan(text: text, style: style),
      maxLines: maxLines,
      textDirection: TextDirection.ltr,
    );

    painter.layout(maxWidth: maxWidth);

    return painter.didExceedMaxLines;
  }

  @override
  Widget build(BuildContext context) {
    const TextStyle textStyle = AppFonts.h3;
    final TextStyle moreStyle = textStyle.copyWith(color: AppColors.unknown);
    final AppLocalization localization = context.localization;

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final bool hasOverflow = _isOverflowing(
          text: widget.text,
          style: textStyle,
          maxWidth: constraints.maxWidth,
          maxLines: widget.collapsedLines,
        );

        return GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: hasOverflow ? _toggle : null,
          child: AnimatedSize(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeInOut,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              spacing: 6,
              children: <Widget>[
                Expanded(
                  child: Text(
                    widget.text,
                    style: textStyle.copyWith(color: context.colors.text.main),
                    maxLines: _expanded ? null : widget.collapsedLines,
                    overflow: _expanded ? TextOverflow.visible : TextOverflow.ellipsis,
                  ),
                ),
                if (hasOverflow)
                  GestureDetector(
                    onTap: _toggle,
                    child: Text(
                      _expanded
                          ? localization.expandable_text_fold_label
                          : localization.expandable_text_expand_label,
                      style: moreStyle,
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
