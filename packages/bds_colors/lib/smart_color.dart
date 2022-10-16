import 'package:flutter/painting.dart';

/// Color mode.
///
/// [ColorMode.auto] for automatic color mode
/// detection based on the platform brightness.
enum ColorMode {
  light,
  dark,
  auto,
}

/// Represent a color tha can change its value based on [ColorMode].
///
/// Use [resolve] function to get the raw color value.
class SmartColor {
  /// Create a [SmartColor] with light and dark values.
  const SmartColor(this.light, this.dark);

  /// Create a [SmartColor] from a single value.
  const SmartColor.constant(Color color) : this(color, color);

  /// Raw color value for light [ColorMode].
  final Color light;

  /// Raw color value for dark [ColorMode].
  final Color dark;

  /// Invert [light] and [dark] values.
  SmartColor invert() => SmartColor(dark, light);

  /// Get the raw color value based on [colorMode].
  ///
  /// The function [resolveAutoMode] will be used if [colorMode] is [ColorMode.auto].
  /// [resolveAutoMode] should return a [Color] according to the platform brightness.
  Color resolve(
    ColorMode colorMode,
    Color Function(Color light, Color dark) resolveAutoMode,
  ) {
    if (colorMode == ColorMode.light) {
      return light;
    } else if (colorMode == ColorMode.dark) {
      return dark;
    } else {
      return resolveAutoMode(light, dark);
    }
  }
}
