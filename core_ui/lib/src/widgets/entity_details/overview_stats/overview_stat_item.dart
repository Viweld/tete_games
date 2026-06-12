import 'package:core_ui/core_ui.dart';

@immutable
class OverviewStatItem {
  const OverviewStatItem({required this.icon, required this.label, required this.value});

  final AppIcon icon;
  final String label;
  final String value;
}
