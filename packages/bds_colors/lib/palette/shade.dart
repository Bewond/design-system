/// Shades for [ColorPalette].
enum Shade {
  /// Example use case: App background.
  shade1,

  /// Example use case: Subtle background.
  shade2,

  /// Example use case: Element background.
  shade3,

  /// Example use case: Hovered element background.
  shade4,

  /// Example use case: Active/Selected element background.
  shade5,

  /// Example use case: Subtle borders and separators.
  shade6,

  /// Example use case: Element border and focus rings.
  shade7,

  /// Example use case: Hovered element border.
  shade8,

  /// Example use case: Solid backgrounds.
  shade9,

  /// Example use case: Hovered solid backgrounds.
  shade10,

  /// Example use case: Low-contrast text.
  shade11,

  /// Example use case: High-contrast text.
  shade12,
}

/// Useful functions for [Shade].
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
