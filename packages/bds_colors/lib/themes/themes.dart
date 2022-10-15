import 'package:flutter/painting.dart';

import 'package:bds_colors/bds_colors.dart';

class Themes {
  static const white = ColorsTheme(
    name: 'white',
    data: {
      Token.background: ResponsiveColor(Color(0xFFFFFFFF), Color(0xFF161616)),
      Token.backgroundHover: PaletteColor(Palettes.gray, Shade.shade2),
      Token.backgroundActive: PaletteColor(Palettes.gray, Shade.shade5),
      Token.backgroundSelected: PaletteColor(Palettes.gray, Shade.shade6),
      Token.backgroundSelectedHover: PaletteColor(Palettes.gray, Shade.shade7),
      Token.backgroundBrand: PaletteColor(Palettes.blue, Shade.shade9),
      Token.backgroundInverse: PaletteColor(Palettes.gray, Shade.shade1),
      Token.backgroundInverseHover: PaletteColor(Palettes.gray, Shade.shade4),
    },
  );
}
