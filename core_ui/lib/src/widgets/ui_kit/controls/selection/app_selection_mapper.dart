import 'package:core_ui/core_ui.dart';
import 'package:core_ui/src/widgets/ui_kit/ui_kit.dart';
import 'package:core_ui/src/widgets/widgets.dart';

abstract final class AppSelectionMapper {
  static double edge(AppSelectionSize size) => switch (size) {
    AppSelectionSize.xsmall => 18,
    AppSelectionSize.small => 22,
    AppSelectionSize.large => 24,
  };

  static double radius(AppSelectionSize size) => switch (size) {
    AppSelectionSize.xsmall => 6,
    AppSelectionSize.small => 6,
    AppSelectionSize.large => 6,
  };

  static double iconSize(AppSelectionSize size) => switch (size) {
    AppSelectionSize.xsmall => 8,
    AppSelectionSize.small => 12,
    AppSelectionSize.large => 14,
  };

  static double selectableInnerDiameter(AppSelectionSize size) => edge(size) - 10;

  static double unselectedInnerDiameter(AppSelectionSize size) {
    final double inner = selectableInnerDiameter(size);
    const double minGap = 6.0;
    final double value = inner - minGap;

    final double result = value < 0 ? 0 : value;

    return result;
  }

  static double innerDiameter(AppSelectionSize size, {required bool selected}) =>
      selected ? selectableInnerDiameter(size) : unselectedInnerDiameter(size);
}
