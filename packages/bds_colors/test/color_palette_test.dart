import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/painting.dart';

import 'package:bds_colors/bds_colors.dart';

void main() {
  group('ColorPalette', () {
    test('get colors according to shade', () {
      const palette = ColorPalette(
        name: 'test',
        data: {
          Shade.shade1: SmartColor.constant(Color(0xFF000000)),
          Shade.shade2: SmartColor.constant(Color(0xFFFFFFFF)),
        },
      );

      expect(
        palette[Shade.shade1],
        const SmartColor.constant(Color(0xFF000000)),
      );
      expect(
        palette[Shade.shade2],
        const SmartColor.constant(Color(0xFFFFFFFF)),
      );
    });

    test('throws assertion error if the shade is not defined', () {
      const palette = ColorPalette(
        name: 'test',
        data: {},
      );

      expect(() => palette[Shade.shade1], throwsAssertionError);
    });

    test('create a copy with some values overwritten', () {
      const palette = ColorPalette(
        name: 'test',
        data: {
          Shade.shade1: SmartColor.constant(Color(0xFF000000)),
          Shade.shade2: SmartColor.constant(Color(0xFFFFFFFF)),
        },
      );
      final copy = palette.copyWith(
        data: {
          Shade.shade1: const SmartColor.constant(Color(0xFF161616)),
        },
      );

      expect(copy[Shade.shade1], const SmartColor.constant(Color(0xFF161616)));
      expect(copy[Shade.shade2], const SmartColor.constant(Color(0xFFFFFFFF)));
    });
  });
}
