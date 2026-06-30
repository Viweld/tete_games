import 'package:core_ui/core_ui.dart';

enum _CenteredMessageKind { error, advertising, discovering }

class CenteredMessage extends StatelessWidget {
  const CenteredMessage.error({super.key, required this.title, this.body})
    : _kind = _CenteredMessageKind.error;

  const CenteredMessage.advertising({super.key, this.title, this.body})
    : _kind = _CenteredMessageKind.advertising;

  const CenteredMessage.discovering({super.key, this.title, this.body})
    : _kind = _CenteredMessageKind.discovering;

  final String? title;
  final String? body;
  final _CenteredMessageKind _kind;

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.colors;
    final bool showsIndicator =
        _kind == _CenteredMessageKind.advertising || _kind == _CenteredMessageKind.discovering;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            if (_kind == _CenteredMessageKind.advertising) const AppAdvertisingIndicator(),
            if (_kind == _CenteredMessageKind.discovering) const AppDiscoveringIndicator(),
            if (title != null) ...<Widget>[
              if (showsIndicator) const SizedBox(height: 24),
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
