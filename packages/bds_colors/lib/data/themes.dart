import 'package:flutter/painting.dart';

import 'package:bds_colors/data/base_colors.g.dart';
import 'package:bds_colors/data/palettes.g.dart';

import 'package:bds_colors/palette/shade.dart';
import 'package:bds_colors/theme/color_theme.dart';
import 'package:bds_colors/theme/token.dart';
import 'package:bds_colors/smart_color.dart';

/// Collection of color themes.
class Themes {
  static const _white = Color(0xFFFFFFFF);

  /// The default theme.
  static final main = ColorTheme(
    name: 'main',
    data: {
      Token.background: const SmartColor(_white, BaseColors.grayDark1),
      Token.backgroundHover: Palettes.gray.get(Shade.shade2),
      Token.backgroundActive: Palettes.gray.get(Shade.shade5),
      Token.backgroundSelected: Palettes.gray.get(Shade.shade6),
      Token.backgroundSelectedHover: Palettes.gray.get(Shade.shade7),
      Token.backgroundBrand: Palettes.blue.get(Shade.shade9),
      Token.backgroundInverse: Palettes.gray.get(Shade.shade1).invert(),
      Token.backgroundInverseHover: Palettes.gray.get(Shade.shade2).invert(),
      //
      Token.textPrimary: Palettes.gray.get(Shade.shade12),
      Token.textSecondary: Palettes.gray.get(Shade.shade11),
      Token.textPlaceholder: Palettes.gray.get(Shade.shade8),
      Token.textOnColor: const SmartColor.constant(_white),
      Token.textHelper: Palettes.gray.get(Shade.shade10),
      Token.textError: Palettes.red.get(Shade.shade11),
      Token.textInverse: const SmartColor(_white, BaseColors.grayDark12),
      Token.textDisabled: Palettes.gray.get(Shade.shade8),
      Token.textOnColorDisabled: Palettes.gray.get(Shade.shade9),
    },
  );
}
