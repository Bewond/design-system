import 'package:flutter/widgets.dart';

import 'package:bds_colors/widgets/palette_provider.dart';

class ColorsData extends StatelessWidget {
  const ColorsData({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return PaletteProvider(
      defaultBrightness: MediaQuery.platformBrightnessOf(context),
      child: child,
    );
  }
}
