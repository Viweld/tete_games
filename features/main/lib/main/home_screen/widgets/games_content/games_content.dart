import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';

class GamesContent extends StatelessWidget {
  const GamesContent({super.key, required this.isEnabled});

  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    final AppLocalization localization = context.localization;
    final AppColorsTheme colors = context.colors;
    final double opacity = isEnabled ? 1 : 0.35;

    return Opacity(
      opacity: opacity,
      child: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 1.1,
        ),
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          return DecoratedBox(
            decoration: BoxDecoration(
              color: colors.background.secondaryCard,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: colors.borders.main),
            ),
            child: Center(
              child: index == 0
                  ? Text(
                      localization.peer_games_list_stub,
                      style: AppFonts.b2.copyWith(color: colors.text.secondary),
                      textAlign: TextAlign.center,
                    )
                  : Icon(Icons.videogame_asset_outlined, color: colors.text.secondary, size: 32),
            ),
          );
        },
      ),
    );
  }
}
