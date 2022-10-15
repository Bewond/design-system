import 'package:flutter/widgets.dart';

import 'package:bds_colors/color_palette.dart';
import 'package:bds_colors/widgets/palette_provider.dart';

extension ColorContext on BuildContext {
  Brightness get watchBrightness => PaletteProvider.of(this).brightness;

  Brightness get brightness =>
      PaletteProvider.of(this, listen: false).brightness;
  set brightness(Brightness value) =>
      PaletteProvider.of(this, listen: false).brightness = value;

  Color color(ColorPalette palette, Shade shade) {
    return palette.get(shade, brightness: watchBrightness);
  }
}
