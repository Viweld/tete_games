import 'package:core_ui/core_ui.dart';

class CenteredMessage extends StatelessWidget {
  final String? title;
  final String? body;
  final bool showsLoadingIndicator;

  const CenteredMessage({super.key, this.title, this.body, this.showsLoadingIndicator = false});

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.colors;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            if (showsLoadingIndicator)
              AppSquareLoadingIndicator(color: colors.text.accent, size: 80),
            if (title != null) ...<Widget>[
              if (showsLoadingIndicator) const SizedBox(height: 24),
              Text(
                title!,
                style: AppFonts.h3.copyWith(color: colors.text.main),
                textAlign: TextAlign.center,
              ),
            ],
            if (body != null) ...<Widget>[
              const SizedBox(height: 16),
              Text(
                body!,
                style: AppFonts.b2.copyWith(color: colors.text.main),
                textAlign: TextAlign.center,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
