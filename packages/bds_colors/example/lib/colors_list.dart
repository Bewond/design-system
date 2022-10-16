import 'package:flutter/widgets.dart';
import 'package:bds_colors/bds_colors.dart';

class ColorsList extends StatelessWidget {
  const ColorsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: Column(
        children: const [
          ColorItem(token: Token.background),
          ColorItem(token: Token.backgroundHover),
          ColorItem(token: Token.backgroundActive),
          ColorItem(token: Token.backgroundSelected),
          ColorItem(token: Token.backgroundSelectedHover),
          ColorItem(token: Token.backgroundBrand),
          ColorItem(token: Token.backgroundInverse),
          ColorItem(token: Token.backgroundInverseHover),
          //
          ColorItem(token: Token.textPrimary),
          ColorItem(token: Token.textSecondary),
          ColorItem(token: Token.textPlaceholder),
          ColorItem(token: Token.textOnColor),
          ColorItem(token: Token.textHelper),
          ColorItem(token: Token.textError),
          ColorItem(token: Token.textInverse),
          ColorItem(token: Token.textDisabled),
          ColorItem(token: Token.textOnColorDisabled),
        ],
      ),
    );
  }
}

class ColorItem extends StatelessWidget {
  const ColorItem({Key? key, required this.token}) : super(key: key);

  final Token token;

  @override
  Widget build(BuildContext context) {
    final color = context.themeColor(token);
    final colorString = color.value.toRadixString(16).toUpperCase();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('${token.name} (0x$colorString)'),
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0x22000000)),
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
