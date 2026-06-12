part of '../toggle.dart';

@immutable
class ToggleItem<T> {
  final T value;
  final String label;

  const ToggleItem({required this.value, required this.label});
}
