import 'package:flutter/widgets.dart';
import 'package:state_provider/state_provider.dart';

import 'package:bds_colors/themes/themes.dart';
import 'package:bds_colors/color_theme.dart';

class ThemeState extends ChangeNotifier {
  ThemeState({required ColorTheme theme}) : _theme = theme;

  ColorTheme _theme = Themes.main;

  ColorTheme get theme => _theme;

  set theme(ColorTheme value) {
    if (_theme != value) {
      _theme = value;
      notifyListeners();
    }
  }
}

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
      data: ThemeState(theme: theme),
      child: child,
    );
  }
}
