import 'package:flutter/widgets.dart';

import 'package:bds_colors/theme/token.dart';
import 'package:bds_colors/smart_color.dart';

/// Map all tokens to their corresponding color in the theme.
typedef ColorThemeData = Map<Token, SmartColor>;

/// Configuration of color tokens.
@immutable
class ColorTheme {
  /// Creates a color theme.
  ///
  /// The [name] is used to identify the theme.
  const ColorTheme({
    required this.name,
    required this.data,
  });

  /// Name of the color theme.
  final String name;

  /// Map all tokens to their corresponding color.
  final ColorThemeData data;

  /// Returns the [SmartColor] based on the given [token].
  SmartColor operator [](Token token) {
    // Assert that the token exists in the theme.
    assert(data.containsKey(token));
    return data[token] ?? const SmartColor.constant(Color(0xFF000000));
  }

  /// Creates a copy of this color theme.
  ///
  /// Use [data] to override specific tokens.
  ColorTheme copyWith({
    String? name,
    ColorThemeData? data,
  }) {
    ColorThemeData copyData = Map.from(this.data);
    if (data != null) {
      copyData.addAll(data);
    }

    return ColorTheme(
      name: name ?? this.name,
      data: copyData,
    );
  }
}
