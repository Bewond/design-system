import 'package:flutter/widgets.dart';

import 'package:bds_colors/colors_palette.dart';
import 'package:bds_colors/widgets/palette_provider.dart';

class ColorsData extends StatelessWidget {
  const ColorsData({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return PaletteProvider(
      defaultBrightness: _platformBrightness(context),
      child: child,
    );
  }

  Brightness _platformBrightness(BuildContext context) {
    final platformBrightness = MediaQuery.platformBrightnessOf(context);
    return platformBrightness == Brightness.light
        ? Brightness.light
        : Brightness.dark;
  }
}
