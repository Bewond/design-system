import 'package:flutter/widgets.dart';

import 'package:bds_colors/palette/shade.dart';
import 'package:bds_colors/smart_color.dart';

/// Map all shades to their corresponding color in the palette.
typedef ColorPaletteData = Map<Shade, SmartColor>;

/// Set of related colors with different shades.
@immutable
class ColorPalette {
  /// Creates a color palette.
  ///
  /// The [name] is used to identify the palette.
  const ColorPalette({
    required this.name,
    required this.data,
  });

  /// Name of the color palette.
  final String name;

  /// Map all shades to their corresponding color.
  final ColorPaletteData data;

  /// Returns the [SmartColor] based on the given [shade].
  SmartColor get(Shade shade) {
    // Assert that the shade exists in the palette.
    assert(data.containsKey(shade));
    return data[shade] ?? const SmartColor.constant(Color(0xFF000000));
  }

  /// Creates a copy of this color palette.
  ///
  /// Use [data] to override specific shades.
  ColorPalette copyWith({
    String? name,
    ColorPaletteData? data,
  }) {
    ColorPaletteData copyData = Map.from(this.data);
    if (data != null) {
      copyData.addAll(data);
    }

    return ColorPalette(
      name: name ?? this.name,
      data: copyData,
    );
  }
}
