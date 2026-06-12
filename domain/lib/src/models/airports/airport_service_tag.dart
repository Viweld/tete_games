import 'package:flutter/material.dart';

@immutable
class AirportServiceTag {
  const AirportServiceTag({required this.label, required this.color});

  final String label;
  final Color? color;
}
