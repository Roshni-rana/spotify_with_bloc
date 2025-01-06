import 'package:flutter/material.dart';

extension SizedboxExtension on num {
  SizedBox get heightSizeBox => SizedBox(height: toDouble());
  SizedBox get widthSizeBox => SizedBox(width: toDouble());
}

extension CapatlizeExtension on String {
  String get capatlize =>
      toString()[0].toUpperCase() + toString().substring(1).toLowerCase();
}
