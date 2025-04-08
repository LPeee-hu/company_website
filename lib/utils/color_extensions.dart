// lib/utils/color_extensions.dart
import 'package:flutter/material.dart';

extension ColorExtension on Color {
  Color withValues({int? red, int? green, int? blue, int? alpha}) {
    return Color.fromARGB(
      // ignore: deprecated_member_use
      alpha ?? this.alpha,
      // ignore: deprecated_member_use
      red ?? this.red,
      // ignore: deprecated_member_use
      green ?? this.green,
      // ignore: deprecated_member_use
      blue ?? this.blue,
    );
  }
}
