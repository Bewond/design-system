import 'package:flutter/painting.dart';

import 'package:bds_colors/color_palette.dart';
import 'package:bds_colors/generated/palettes.g.dart';

class BaseColors {
  Color test() {
    Color color = Palettes.amber.get(Shade.shade1, brightness: Brightness.dark);
    return color;
  }
}
