import 'package:flutter/widgets.dart';
import 'package:state_provider/state_provider.dart';

import 'package:bds_colors/theme/color_theme.dart';

/// A [StateValue] that holds the current [ColorTheme].
class ThemeState extends StateValue<ColorTheme> {
  ThemeState({required ColorTheme colorTheme}) : super(colorTheme);

  /// The current [ColorTheme].
  ColorTheme get colorTheme => value;
  set colorTheme(ColorTheme value) => this.value = value;
}

/// Provides a [ThemeState] to its descendants widgets.
///
/// Use [context.watch<ThemeState>().theme] to access the current [ColorTheme].
class ThemeScope extends StatelessWidget {
  const ThemeScope({
    Key? key,
    required this.theme,
    required this.child,
  }) : super(key: key);

  final ColorTheme theme;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return StateProvider(
      state: ThemeState(colorTheme: theme),
      child: child,
    );
  }
}
