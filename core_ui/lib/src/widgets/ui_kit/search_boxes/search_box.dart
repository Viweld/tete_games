part of 'search_boxes.dart';

class SearchBox extends StatelessWidget {
  final bool isButtonEnabled;
  final List<Widget> fields;
  final VoidCallback onTap;
  final String? buttonTitle;

  const SearchBox({
    super.key,
    required this.fields,
    required this.onTap,
    this.isButtonEnabled = true,
    this.buttonTitle,
  });

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.colors;
    final AppLocalization localization = context.localization;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: colors.borders.accentOrange,
        borderRadius: const BorderRadius.all(Radius.circular(6)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 2,
          children: <Widget>[
            ...fields,
            AppElevatedButton(
              title: buttonTitle ?? localization.main_search_button,
              onTap: onTap,
              state: isButtonEnabled ? ElementState.enabled : ElementState.disabled,
            ),
          ],
        ),
      ),
    );
  }
}
