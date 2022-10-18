import 'package:flutter/widgets.dart';
import 'package:state_provider/state_provider.dart';

import 'package:bds_colors/smart_color.dart';

/// A [StateValue] that holds the current [ColorMode].
class PaletteState extends StateValue<ColorMode> {
  PaletteState({required ColorMode colorMode}) : super(colorMode);

  /// The current [ColorMode].
  ColorMode get colorMode => value;
  set colorMode(ColorMode value) => this.value = value;
}

/// Provides a [PaletteState] to its descendants widgets.
///
/// Use [context.watch<PaletteState>().colorMode] to access the current [ColorMode].
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
      state: PaletteState(colorMode: colorMode),
      child: child,
    );
  }
}
