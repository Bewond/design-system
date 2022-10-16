import 'package:flutter/widgets.dart';

import 'package:bds_colors/smart_color.dart';

/// Shades for [ColorPalette].
///
/// From [shade1] to [shade12].
enum Shade {
  shade1,
  shade2,
  shade3,
  shade4,
  shade5,
  shade6,
  shade7,
  shade8,
  shade9,
  shade10,
  shade11,
  shade12,
}

extension ShadeUtils on Shade {
  /// Returns the next shade.
  Shade get next => add(1);

  /// Returns the previous shade.
  Shade get previous => add(-1);

  /// Skips the given [number] of shades.
  Shade add(int number) {
    if (index + number >= Shade.values.length) {
      return Shade.values.last;
    }
    if (index + number < 0) {
      return Shade.values.first;
    }
    return Shade.values[index + number];
  }
}

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
