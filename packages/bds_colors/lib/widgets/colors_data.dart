import 'package:flutter/widgets.dart';

import 'package:bds_colors/data/themes.dart';

import 'package:bds_colors/palette/palette_scope.dart';
import 'package:bds_colors/theme/color_theme.dart';
import 'package:bds_colors/theme/theme_scope.dart';
import 'package:bds_colors/smart_color.dart';

/// Provides colors data to its descendants widgets.
///
/// Should be used as a top-level widget.
class ColorsData extends StatelessWidget {
  const ColorsData({
    Key? key,
    this.colorMode,
    this.colorTheme,
    required this.child,
  }) : super(key: key);

  final ColorMode? colorMode;

  final ColorTheme? colorTheme;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return PaletteScope(
      colorMode: colorMode ?? ColorMode.auto,
      child: ThemeScope(
        theme: colorTheme ?? Themes.main,
        child: child,
      ),
    );
  }
}
