import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/painting.dart';

import 'package:bds_colors/bds_colors.dart';

void main() {
  group('ColorTheme', () {
    test('get colors according to shade (light color mode)', () {
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

    test('get colors according to shade (dark color mode)', () {
      const palette = ColorPalette(
        name: 'test',
        data: {
          Shade.shade1: SmartColor(Color(0xFFFFFFFF), Color(0xFF000000)),
          Shade.shade2: SmartColor(Color(0xFFDDDDDD), Color(0xFF222222)),
        },
      );
      resolveAuto(Color light, Color dark) => dark;

      expect(palette.get(Shade.shade1).resolve(ColorMode.dark, resolveAuto),
          const Color(0xFF000000));
      expect(palette.get(Shade.shade2).resolve(ColorMode.dark, resolveAuto),
          const Color(0xFF222222));
    });

    test('get colors according to shade (auto color mode)', () {
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

    test('create a copy with some values overwritten', () {
      const palette = ColorPalette(
        name: 'test',
        data: {
          Shade.shade1: SmartColor(Color(0xFFFFFFFF), Color(0xFF000000)),
          Shade.shade2: SmartColor(Color(0xFFDDDDDD), Color(0xFF222222)),
        },
      );
      var copy = palette.copyWith(
        name: 'test2',
        data: {
          Shade.shade1: const SmartColor(Color(0xFF000000), Color(0xFFFFFFFF)),
        },
      );
      resolveAuto(Color light, Color dark) => light;

      expect(copy.get(Shade.shade1).resolve(ColorMode.auto, resolveAuto),
          const Color(0xFF000000));
      expect(copy.get(Shade.shade2).resolve(ColorMode.auto, resolveAuto),
          const Color(0xFFDDDDDD));
    });
  });
}
