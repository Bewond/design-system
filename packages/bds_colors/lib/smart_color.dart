import 'package:flutter/painting.dart';

enum ColorMode {
  light,
  dark,
  auto,
}

class SmartColor {
  const SmartColor(this.light, this.dark);

  const SmartColor.constant(Color color) : this(color, color);

  final Color light;
  final Color dark;

  SmartColor invert() => SmartColor(dark, light);

  Color resolve(
    ColorMode colorMode,
    Color Function(Color light, Color dark) resolveAutoMode,
  ) {
    if (colorMode == ColorMode.light) {
      return light;
    } else if (colorMode == ColorMode.dark) {
      return dark;
    } else {
      return resolveAutoMode(light, dark);
    }
  }
}
