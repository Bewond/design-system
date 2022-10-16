/// Shades for [ColorPalette].
///
/// From [shade1] to [shade12], each [Shade] is designed
/// for at least one specific use case:
///
/// * [shade1]-[shade4] for app backgrounds and subtle component backgrounds.
/// * [shade3]-[shade5] for component backgrounds.
/// * [shade6]-[shade8] for borders.
/// * [shade9]-[shade10] for solid backgrounds.
/// * [shade11]-[shade12] for text.
enum Shade {
  /// Use Case: App background.
  shade1,

  /// Use Case: Subtle background.
  shade2,

  /// Use Case: Element background.
  shade3,

  /// Use Case: Hovered element background.
  shade4,

  /// Use Case: Active/Selected element background.
  shade5,

  /// Use Case: Subtle borders and separators.
  shade6,

  /// Use Case: element border and focus rings.
  shade7,

  /// Use Case: Hovered element border.
  shade8,

  /// Use Case: Solid backgrounds.
  shade9,

  /// Use Case: Hovered solid backgrounds.
  shade10,

  /// Use Case: Low-contrast text.
  shade11,

  /// Use Case: High-contrast text.
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
