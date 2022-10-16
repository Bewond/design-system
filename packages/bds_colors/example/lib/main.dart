import 'package:flutter/material.dart';

import 'package:bds_colors/bds_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    print("Build MyApp");

    return ColorsData(
      colorMode: ColorMode.light,
      colorTheme: Themes.main.copyWith(data: {
        Token.background: Palettes.blue.get(Shade.shade5),
      }),
      child: MaterialApp(
        title: 'BDS Example',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    print("Build MyHomePage");

    return Scaffold(
      appBar: AppBar(title: const Text('BDS Colors Example')),
      body: ListView(
        children: const [
          MyHomeText(),
          MyHomeButton(),
        ],
      ),
    );
  }
}

class MyHomeText extends StatelessWidget {
  const MyHomeText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Build MyHomeText");

    return Column(
      children: [
        Text('Color mode: ${context.watchColorMode}'),
      ],
    );
  }
}

class MyHomeButton extends StatelessWidget {
  const MyHomeButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Build MyHomeButton");

    final buttonStyle = ElevatedButton.styleFrom(
      backgroundColor: context.themeColor(Token.background),
    );
    final textStyle = TextStyle(
      color: context.paletteColor(Palettes.gray, Shade.shade12),
    );

    return Center(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () => context.colorMode = ColorMode.light,
            style: buttonStyle,
            child: Text('Light Mode', style: textStyle),
          ),
          ElevatedButton(
            onPressed: () => context.colorMode = ColorMode.dark,
            style: buttonStyle,
            child: Text('Dark Mode', style: textStyle),
          ),
          ElevatedButton(
            onPressed: () => context.colorMode = ColorMode.auto,
            style: buttonStyle,
            child: Text('Auto Mode', style: textStyle),
          ),
        ],
      ),
    );
  }
}
