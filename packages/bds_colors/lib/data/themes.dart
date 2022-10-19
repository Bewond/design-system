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
      Token.backgroundHover: Palettes.gray[Shade.shade2],
      Token.backgroundActive: Palettes.gray[Shade.shade5],
      Token.backgroundSelected: Palettes.gray[Shade.shade6],
      Token.backgroundSelectedHover: Palettes.gray[Shade.shade7],
      Token.backgroundBrand: Palettes.blue[Shade.shade9],
      Token.backgroundInverse: Palettes.gray[Shade.shade1].invert(),
      Token.backgroundInverseHover: Palettes.gray[Shade.shade2].invert(),
      //
      Token.textPrimary: Palettes.gray[Shade.shade12],
      Token.textSecondary: Palettes.gray[Shade.shade11],
      Token.textPlaceholder: Palettes.gray[Shade.shade8],
      Token.textOnColor: const SmartColor.constant(_white),
      Token.textHelper: Palettes.gray[Shade.shade10],
      Token.textError: Palettes.red[Shade.shade11],
      Token.textInverse: const SmartColor(_white, BaseColors.grayDark12),
      Token.textDisabled: Palettes.gray[Shade.shade8],
      Token.textOnColorDisabled: Palettes.gray[Shade.shade9],
    },
  );
}
