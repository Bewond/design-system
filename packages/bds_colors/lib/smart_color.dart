import 'package:flutter/foundation.dart';
import 'package:flutter/painting.dart';

class SmartColor {
  const SmartColor(this.light, this.dark);

  const SmartColor.constant(Color color) : this(color, color);

  final Color light;
  final Color dark;

  SmartColor invert() => SmartColor(dark, light);

  Color resolve(Brightness brightness) {
    return brightness == Brightness.light ? light : dark;
  }
}
