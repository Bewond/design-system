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
  /// Watch the current [ColorMode].
  ///
  /// This will rebuild the widget when the [ColorMode] changes.
  ColorMode get watchColorMode => watch<PaletteState>().colorMode;

  /// The current [ColorMode].
  ColorMode get colorMode => read<PaletteState>().colorMode;
  set colorMode(ColorMode value) => read<PaletteState>().colorMode = value;

  /// Watch the current [ColorTheme].
  ///
  /// This will rebuild the widget when the [ColorTheme] changes.
  ColorTheme get watchColorTheme => watch<ThemeState>().colorTheme;

  /// The current [ColorTheme].
  ColorTheme get colorTheme => read<ThemeState>().colorTheme;
  set colorTheme(ColorTheme value) => read<ThemeState>().colorTheme = value;

  /// Get a color value from a specified [ColorPalette].
  ///
  /// This will rebuild the widget when the [ColorMode] changes.
  Color paletteColor(ColorPalette palette, Shade shade) {
    return _resolveSmartColor(palette[shade]);
  }

  /// Get a color value from the current [ColorTheme].
  ///
  /// This will rebuild the widget when the [ColorMode]
  /// or the current [ColorTheme] changes.
  Color themeColor(Token token) {
    return _resolveSmartColor(watchColorTheme[token]);
  }

  Color _resolveSmartColor(SmartColor smartColor) {
    return smartColor.resolve(watchColorMode, (light, dark) {
      // Resolve auto mode according to the platform brightness.
      final brightness = MediaQuery.platformBrightnessOf(this);
      return brightness == Brightness.light ? light : dark;
    });
  }
}
