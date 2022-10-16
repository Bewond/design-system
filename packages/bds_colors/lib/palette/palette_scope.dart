import 'package:flutter/widgets.dart';
import 'package:state_provider/state_provider.dart';

import 'package:bds_colors/smart_color.dart';

/// A [ChangeNotifier] that holds the current [ColorMode].
class PaletteState extends ChangeNotifier {
  PaletteState({ColorMode colorMode = ColorMode.auto}) : _colorMode = colorMode;

  ColorMode _colorMode = ColorMode.auto;

  ColorMode get colorMode => _colorMode;

  set colorMode(ColorMode value) {
    if (_colorMode != value) {
      _colorMode = value;
      notifyListeners();
    }
  }
}

/// Provides a [PaletteState] to its descendants widgets.
///
/// Use [context.watch<PaletteState>().theme] to access the current [ColorMode].
class PaletteScope extends StatelessWidget {
  const PaletteScope({
    Key? key,
    required this.colorMode,
    required this.child,
  }) : super(key: key);

  final ColorMode colorMode;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return StateProvider(
      data: PaletteState(colorMode: colorMode),
      child: child,
    );
  }
}