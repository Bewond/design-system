import 'package:flutter/widgets.dart';

import 'package:bds_colors/widgets/palette_provider.dart';
import 'package:bds_colors/smart_color.dart';

class ColorsData extends StatelessWidget {
  const ColorsData({
    Key? key,
    this.colorMode = ColorMode.auto,
    required this.child,
  }) : super(key: key);

  final ColorMode colorMode;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return PaletteScope(
      colorMode: colorMode,
      child: child,
    );
  }
}
