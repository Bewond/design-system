import 'package:flutter_test/flutter_test.dart';

import 'package:bds_colors/bds_colors.dart';

void main() {
  group('ShadeUtils', () {
    test('next get the next shade according to the sort order', () {
      const shade1 = Shade.shade1;
      expect(shade1.next, Shade.shade2);
    });

    test('previous get the previous shade according to the sort order', () {
      const shade2 = Shade.shade2;
      expect(shade2.previous, Shade.shade1);
    });

    test('next on the last shade returns itself', () {
      const shade12 = Shade.shade12;
      expect(shade12.next, Shade.shade12);
    });

    test('previous on the firs shade returns itself', () {
      const shade1 = Shade.shade1;
      expect(shade1.previous, Shade.shade1);
    });

    test('add 2 skip forward 2 shades in the sort order', () {
      const shade4 = Shade.shade4;
      expect(shade4.add(2), Shade.shade6);
    });

    test('add -2 skip back 2 shades in the sort order', () {
      const shade4 = Shade.shade4;
      expect(shade4.add(-2), Shade.shade2);
    });

    test('add over the last shade returns the last shade', () {
      const shade4 = Shade.shade4;
      expect(shade4.add(100), Shade.shade12);
    });

    test('add negative past the firs shade returns the firs shade', () {
      const shade4 = Shade.shade4;
      expect(shade4.add(-100), Shade.shade1);
    });
  });
}
