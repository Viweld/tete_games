import 'package:core_ui/core_ui.dart';

class AppMarkedBox extends StatelessWidget {
  final String? title;
  final Color lineColor;
  final Widget child;

  const AppMarkedBox({super.key, this.title, required this.lineColor, required this.child});

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.colors;

    return Stack(
      children: <Widget>[
        Positioned.fill(
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: 4,
              decoration: BoxDecoration(
                color: lineColor,
                borderRadius: const BorderRadius.all(Radius.circular(2)),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              if (title != null)
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(title ?? '', style: AppFonts.b4.copyWith(color: colors.text.main)),
                ),
              child,
            ],
          ),
        ),
      ],
    );
  }
}
