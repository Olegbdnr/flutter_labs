import 'package:flutter/material.dart';

double responsiveFont(
  BuildContext context, {
  required double base,
  double min = 12,
  double max = 32,
}) {
  final scaler = MediaQuery.of(context).textScaler;
  final scaled = scaler.scale(base);

  return scaled.clamp(min, max);
}
