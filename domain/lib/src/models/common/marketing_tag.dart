import 'package:flutter/material.dart';

@immutable
class MarketingTag {
  final String label;
  final Color? backgroundColor;
  final Color? textColor;

  const MarketingTag({required this.label, this.backgroundColor, this.textColor});
}
