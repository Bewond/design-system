import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:state_provider/state_provider.dart';

import 'package:bds_colors/widgets/palette_scope.dart';
import 'package:bds_colors/color_palette.dart';
import 'package:bds_colors/smart_color.dart';

extension ColorContext on BuildContext {
  ColorMode get watchColorMode => watch<PaletteState>().colorMode;

  ColorMode get colorMode => read<PaletteState>().colorMode;

  set colorMode(ColorMode value) => read<PaletteState>().colorMode = value;

  Color color(ColorPalette palette, Shade shade) {
    final smartColor = palette.get(shade);

    return smartColor.resolve(watchColorMode, (light, dark) {
      // Resolve auto mode according to the platform brightness.
      final brightness = MediaQuery.platformBrightnessOf(this);
      return brightness == Brightness.light ? light : dark;
    });
  }
}
