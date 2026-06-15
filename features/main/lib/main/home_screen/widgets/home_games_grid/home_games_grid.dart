import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class HomeGamesGrid extends StatelessWidget {
  const HomeGamesGrid({super.key, required this.isEnabled, required this.emptyLabel});

  final bool isEnabled;
  final String emptyLabel;

  @override
  Widget build(BuildContext context) {
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
                  ? Text(emptyLabel, textAlign: TextAlign.center)
                  : Icon(Icons.videogame_asset_outlined, color: colors.text.secondary, size: 32),
            ),
          );
        },
      ),
    );
  }
}
