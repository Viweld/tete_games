import 'package:core_ui/core_ui.dart';

class NumberedStepsSection extends StatelessWidget {
  const NumberedStepsSection({super.key, required this.title, required this.steps});

  final String title;
  final List<String> steps;

  @override
  Widget build(BuildContext context) {
    if (steps.isEmpty) {
      return const SizedBox.shrink();
    }

    final AppColorsTheme colors = context.colors;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 12,
      children: <Widget>[
        Text(title, style: AppFonts.h5.copyWith(color: colors.text.main)),
        ...List<Widget>.generate(steps.length, (int index) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 12,
            children: <Widget>[
              CircleAvatar(
                radius: 10,
                backgroundColor: colors.icons.main,
                child: Text(
                  '${index + 1}',
                  style: AppFonts.caption.copyWith(color: colors.background.main),
                ),
              ),
              Expanded(
                child: Text(steps[index], style: AppFonts.b2.copyWith(color: colors.text.main)),
              ),
            ],
          );
        }),
      ],
    );
  }
}
