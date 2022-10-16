import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/painting.dart';

import 'package:bds_colors/bds_colors.dart';

void main() {
  group('SmartColor', () {
    test('resolve according to light color mode', () {
      const smartColor = SmartColor(Color(0xFF000000), Color(0xFFFFFFFF));
      final color = smartColor.resolve(ColorMode.light, (light, dark) => light);

      expect(color, const Color(0xFF000000));
    });

    test('resolve according to dark color mode', () {
      const smartColor = SmartColor(Color(0xFF000000), Color(0xFFFFFFFF));
      final color = smartColor.resolve(ColorMode.dark, (light, dark) => light);

      expect(color, const Color(0xFFFFFFFF));
    });

    test('resolve according to auto color mode', () {
      const smartColor = SmartColor(Color(0xFF000000), Color(0xFFFFFFFF));
      final color1 = smartColor.resolve(ColorMode.auto, (light, dark) => light);
      final color2 = smartColor.resolve(ColorMode.auto, (light, dark) => dark);

      expect(color1, const Color(0xFF000000));
      expect(color2, const Color(0xFFFFFFFF));
    });

    test('create constant color from a single value', () {
      const smartColor = SmartColor.constant(Color(0xFF000000));

      expect(smartColor.light, smartColor.dark);
    });

    test('invert color values', () {
      const smartColor = SmartColor(Color(0xFF000000), Color(0xFFFFFFFF));
      final inverted = smartColor.invert();

      expect(smartColor.light, inverted.dark);
      expect(smartColor.dark, inverted.light);
    });
  });
}
