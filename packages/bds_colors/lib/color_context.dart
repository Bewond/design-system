import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:state_provider/state_provider.dart';

import 'package:bds_colors/palette/color_palette.dart';
import 'package:bds_colors/palette/palette_scope.dart';
import 'package:bds_colors/palette/shade.dart';
import 'package:bds_colors/theme/color_theme.dart';
import 'package:bds_colors/theme/theme_scope.dart';
import 'package:bds_colors/theme/token.dart';

import 'package:bds_colors/smart_color.dart';

extension ColorContext on BuildContext {
  ColorMode get watchColorMode => watch<PaletteState>().colorMode;

  ColorMode get colorMode => read<PaletteState>().colorMode;
  set colorMode(ColorMode value) => read<PaletteState>().colorMode = value;

  ColorTheme get watchColorTheme => watch<ThemeState>().theme;

  ColorTheme get colorTheme => read<ThemeState>().theme;
  set colorTheme(ColorTheme value) => read<ThemeState>().theme = value;

  Color paletteColor(ColorPalette palette, Shade shade) {
    return _resolveSmartColor(palette.get(shade));
  }

  Color themeColor(Token token) {
    return _resolveSmartColor(watchColorTheme.get(token));
  }

  Color _resolveSmartColor(SmartColor smartColor) {
    return smartColor.resolve(watchColorMode, (light, dark) {
      // Resolve auto mode according to the platform brightness.
      final brightness = MediaQuery.platformBrightnessOf(this);
      return brightness == Brightness.light ? light : dark;
    });
  }
}
