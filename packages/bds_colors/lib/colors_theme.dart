import 'package:flutter/widgets.dart';

import 'package:bds_colors/colors_context.dart';
import 'package:bds_colors/colors_palette.dart';

abstract class ThemeColor {
  Color resolve(BuildContext context);
}

class ConstantColor implements ThemeColor {
  const ConstantColor(this.color);

  final Color color;

  @override
  Color resolve(BuildContext context) => color;
}

class PaletteColor implements ThemeColor {
  const PaletteColor(this.palette, this.shade);

  final ColorsPalette palette;
  final Shade shade;

  @override
  Color resolve(BuildContext context) =>
      palette.get(shade, brightness: context.watchBrightness);
}

class ResponsiveColor implements ThemeColor {
  const ResponsiveColor(this.light, this.dark);

  final Color light;
  final Color dark;

  @override
  Color resolve(BuildContext context) {
    if (context.watchBrightness == Brightness.light) {
      return light;
    }
    return dark;
  }
}

enum Token {
  background,
  backgroundHover,
  backgroundActive,
  backgroundSelected,
  backgroundSelectedHover,
  backgroundBrand,
  backgroundInverse,
  backgroundInverseHover,
}

typedef ColorsThemeData = Map<Token, ThemeColor>;

class ColorsTheme {
  const ColorsTheme({
    required this.name,
    required this.data,
  });

  final String name;

  final ColorsThemeData data;

  Color resolve(Token token, BuildContext context) {
    assert(data.containsKey(token));
    return data[token]!.resolve(context);
  }
}
