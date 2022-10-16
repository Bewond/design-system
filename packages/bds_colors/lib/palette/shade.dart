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
