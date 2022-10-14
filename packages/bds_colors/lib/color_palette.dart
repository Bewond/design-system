import 'package:flutter/painting.dart';

/// Brightness of the color palette.
///
/// Can be either [light] or [dark].
enum Brightness { light, dark }

/// Shades of the color palette.
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
typedef PaletteData = Map<Shade, Color>;

/// Collection of related colors with different shades and brightness.
class ColorPalette {
  /// Creates a color palette.
  ///
  /// The [name] is used to identify the palette.
  const ColorPalette({
    required this.name,
    required this.light,
    required this.dark,
  });

  /// Name of the color palette.
  final String name;

  /// Map shades to their corresponding light colors.
  final PaletteData light;

  /// Map shades to their corresponding dark colors.
  final PaletteData dark;

  /// Returns the color based on the given [shade] and [brightness].
  ///
  /// Defaults to [Brightness.light].
  Color get(Shade shade, {Brightness brightness = Brightness.light}) {
    final data = brightness == Brightness.dark ? dark : light;
    // Assert that the shade exists in the palette.
    assert(data.containsKey(shade));
    return data[shade] ?? const Color(0xFF000000);
  }
}
