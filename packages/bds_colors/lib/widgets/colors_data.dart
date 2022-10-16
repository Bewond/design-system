import 'package:flutter/widgets.dart';

import 'package:bds_colors/themes/themes.dart';
import 'package:bds_colors/widgets/palette_scope.dart';
import 'package:bds_colors/widgets/theme_scope.dart';

import 'package:bds_colors/color_theme.dart';
import 'package:bds_colors/smart_color.dart';

class ColorsData extends StatelessWidget {
  const ColorsData({
    Key? key,
    this.colorMode,
    this.theme,
    required this.child,
  }) : super(key: key);

  final ColorMode? colorMode;

  final ColorTheme? theme;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return PaletteScope(
      colorMode: colorMode ?? ColorMode.auto,
      child: ThemeScope(
        theme: theme ?? Themes.main,
        child: child,
      ),
    );
  }
}
