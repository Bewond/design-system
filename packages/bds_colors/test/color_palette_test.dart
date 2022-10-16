import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/painting.dart';

import 'package:bds_colors/bds_colors.dart';

void main() {
  group('ColorPalette', () {
    test('returns the color according to shade (light color mode)', () {
      const palette = ColorPalette(
        name: 'test',
        data: {
          Shade.shade1: SmartColor(Color(0xFFFFFFFF), Color(0xFF000000)),
          Shade.shade2: SmartColor(Color(0xFFDDDDDD), Color(0xFF222222)),
        },
      );
      resolveAuto(Color light, Color dark) => light;

      expect(palette.get(Shade.shade1).resolve(ColorMode.light, resolveAuto),
          const Color(0xFFFFFFFF));
      expect(palette.get(Shade.shade2).resolve(ColorMode.light, resolveAuto),
          const Color(0xFFDDDDDD));
    });

    test('returns the color according to shade (dark color mode)', () {
      const palette = ColorPalette(
        name: 'test',
        data: {
          Shade.shade1: SmartColor(Color(0xFFFFFFFF), Color(0xFF000000)),
          Shade.shade2: SmartColor(Color(0xFFDDDDDD), Color(0xFF222222)),
        },
      );
      resolveAuto(Color light, Color dark) => light;

      expect(palette.get(Shade.shade1).resolve(ColorMode.dark, resolveAuto),
          const Color(0xFF000000));
      expect(palette.get(Shade.shade2).resolve(ColorMode.dark, resolveAuto),
          const Color(0xFF222222));
    });

    test('returns the color according to shade (auto color mode)', () {
      const palette = ColorPalette(
        name: 'test',
        data: {
          Shade.shade1: SmartColor(Color(0xFFFFFFFF), Color(0xFF000000)),
          Shade.shade2: SmartColor(Color(0xFFDDDDDD), Color(0xFF222222)),
        },
      );
      resolveAuto(Color light, Color dark) => light;

      expect(palette.get(Shade.shade1).resolve(ColorMode.auto, resolveAuto),
          const Color(0xFFFFFFFF));
      expect(palette.get(Shade.shade2).resolve(ColorMode.auto, resolveAuto),
          const Color(0xFFDDDDDD));
    });

    test('throws assertion error if the shade is not defined', () {
      const palette = ColorPalette(
        name: 'test',
        data: {},
      );

      expect(() => palette.get(Shade.shade1), throwsAssertionError);
    });
  });
}
