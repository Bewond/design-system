import 'package:flutter/widgets.dart';

import 'package:bds_colors/colors_palette.dart';
import 'package:bds_colors/widgets/palette_provider.dart';

extension ColorsContext on BuildContext {
  Brightness get watchBrightness => PaletteProvider.of(this).brightness;

  Brightness get brightness =>
      PaletteProvider.of(this, listen: false).brightness;
  set brightness(Brightness value) =>
      PaletteProvider.of(this, listen: false).brightness = value;

  Color color(ColorsPalette palette, Shade shade) {
    return palette.get(shade, brightness: watchBrightness);
  }
}
