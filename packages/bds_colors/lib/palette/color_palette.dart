import 'package:flutter/widgets.dart';

import 'package:bds_colors/palette/shade.dart';
import 'package:bds_colors/smart_color.dart';

/// Map shades to their corresponding color in the palette.
typedef ColorPaletteData = Map<Shade, SmartColor>;

/// Set of related colors with different shades and brightness.
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

  /// Map shades to their corresponding color.
  final ColorPaletteData data;

  /// Returns the color based on the given [shade].
  SmartColor get(Shade shade) {
    // Assert that the shade exists in the palette.
    assert(data.containsKey(shade));
    return data[shade] ?? const SmartColor.constant(Color(0xFF000000));
  }

  ColorPalette copyWith({
    String? name,
    ColorPaletteData? data,
  }) {
    final copyData = this.data;
    if (data != null) {
      copyData.addAll(data);
    }

    return ColorPalette(
      name: name ?? this.name,
      data: copyData,
    );
  }
}
