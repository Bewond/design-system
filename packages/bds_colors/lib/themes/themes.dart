import 'package:flutter/painting.dart';

import 'package:bds_colors/color_theme.dart';
import 'package:bds_colors/smart_color.dart';

class Themes {
  static const main = ColorTheme(
    name: 'white',
    data: {
      Token.background: SmartColor(Color(0xFFFFFFFF), Color(0xFF161616)),
    },
  );
}
