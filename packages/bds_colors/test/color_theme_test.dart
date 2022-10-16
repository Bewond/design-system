import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/painting.dart';

import 'package:bds_colors/bds_colors.dart';

void main() {
  group('ColorTheme', () {
    test('get colors according to token', () {
      const theme = ColorTheme(
        name: 'test',
        data: {
          Token.background: SmartColor.constant(Color(0xFF000000)),
          Token.textPrimary: SmartColor.constant(Color(0xFFFFFFFF)),
        },
      );

      expect(
        theme.get(Token.background),
        const SmartColor.constant(Color(0xFF000000)),
      );
      expect(
        theme.get(Token.textPrimary),
        const SmartColor.constant(Color(0xFFFFFFFF)),
      );
    });

    test('throws assertion error if the token is not defined', () {
      const theme = ColorTheme(
        name: 'test',
        data: {},
      );

      expect(() => theme.get(Token.background), throwsAssertionError);
    });

    test('create a copy with some values overwritten', () {
      const theme = ColorTheme(
        name: 'test',
        data: {
          Token.background: SmartColor.constant(Color(0xFF000000)),
          Token.textPrimary: SmartColor.constant(Color(0xFFFFFFFF)),
        },
      );
      final copy = theme.copyWith(
        data: {
          Token.background: const SmartColor.constant(Color(0xFF161616)),
        },
      );

      expect(
        copy.get(Token.background),
        const SmartColor.constant(Color(0xFF161616)),
      );
      expect(
        copy.get(Token.textPrimary),
        const SmartColor.constant(Color(0xFFFFFFFF)),
      );
    });
  });
}
