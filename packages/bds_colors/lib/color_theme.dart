import 'package:flutter/widgets.dart';

import 'package:bds_colors/smart_color.dart';

/// Tokens for [ColorTheme].
enum Token {
  background,
  backgroundHover,
  backgroundActive,
  backgroundSelected,
  backgroundSelectedHover,
  backgroundBrand,
  backgroundInverse,
  backgroundInverseHover,
}

/// Map tokens to their corresponding color in the theme.
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

  /// Map tokens to their corresponding color.
  final ColorThemeData data;

  /// Returns the color based on the given [token].
  SmartColor get(Token token) {
    // Assert that the token exists in the theme.
    assert(data.containsKey(token));
    return data[token] ?? const SmartColor.constant(Color(0xFF000000));
  }

  ColorTheme copyWith({
    String? name,
    ColorThemeData? data,
  }) {
    final copyData = this.data;
    if (data != null) {
      copyData.addAll(data);
    }

    return ColorTheme(
      name: name ?? this.name,
      data: copyData,
    );
  }
}
