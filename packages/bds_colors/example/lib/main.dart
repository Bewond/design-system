import 'package:flutter/material.dart';
import 'package:bds_colors/bds_colors.dart';

import 'package:bds_colors_example/colors_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ColorsData(
      colorMode: ColorMode.light,
      child: Builder(builder: (context) {
        return const MaterialApp(
          title: 'BDS Example',
          home: MyHomePage(),
        );
      }),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BDS Colors Example')),
      body: ListView(
        children: const [
          MyHomeText(),
          MyHomeButton(),
          ColorsList(),
        ],
      ),
    );
  }
}

class MyHomeText extends StatelessWidget {
  const MyHomeText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Center(
        child: Text('Color mode: ${context.watchColorMode}'),
      ),
    );
  }
}

class MyHomeButton extends StatelessWidget {
  const MyHomeButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final buttonStyle = ElevatedButton.styleFrom(
      backgroundColor: context.themeColor(Token.backgroundActive),
    );
    final textStyle = TextStyle(
      color: context.themeColor(Token.textPrimary),
    );

    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FilledButton(
            onPressed: () => context.colorMode = ColorMode.light,
            style: buttonStyle,
            child: Text('Light Mode', style: textStyle),
          ),
          FilledButton(
            onPressed: () => context.colorMode = ColorMode.dark,
            style: buttonStyle,
            child: Text('Dark Mode', style: textStyle),
          ),
          FilledButton(
            onPressed: () => context.colorMode = ColorMode.auto,
            style: buttonStyle,
            child: Text('Auto Mode', style: textStyle),
          ),
        ],
      ),
    );
  }
}
