import 'package:core_ui/core_ui.dart';

/// A widget used as separator in lists.
class AppDivider extends StatelessWidget {
  final double horizontalIndents;

  const AppDivider({super.key, this.horizontalIndents = 0});

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1,
      thickness: 1,
      indent: horizontalIndents,
      endIndent: horizontalIndents,
      color: context.colors.borders.main,
      radius: const BorderRadius.all(Radius.circular(0.5)),
    );
  }
}
