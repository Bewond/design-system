import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class PaletteProviderData {
  const PaletteProviderData({this.brightness = Brightness.light});

  final Brightness brightness;

  PaletteProviderData copyWith({Brightness? brightness}) {
    return PaletteProviderData(
      brightness: brightness ?? this.brightness,
    );
  }
}

class PaletteProvider extends StatefulWidget {
  const PaletteProvider({
    Key? key,
    required this.defaultBrightness,
    required this.child,
  }) : super(key: key);

  final Brightness defaultBrightness;

  final Widget child;

  @override
  State<PaletteProvider> createState() => PaletteProviderState();

  static PaletteProviderState of(BuildContext context, {bool listen = true}) {
    return listen
        ? context.dependOnInheritedWidgetOfExactType<_InheritedPalette>()!.state
        : context.findAncestorWidgetOfExactType<_InheritedPalette>()!.state;
  }
}

class PaletteProviderState extends State<PaletteProvider> {
  PaletteProviderData _data = const PaletteProviderData();

  Brightness get brightness => _data.brightness;
  set brightness(Brightness brightness) {
    setState(() {
      _data = _data.copyWith(brightness: brightness);
    });
  }

  @override
  void initState() {
    super.initState();
    _data = _data.copyWith(brightness: widget.defaultBrightness);
  }

  @override
  Widget build(BuildContext context) {
    return _InheritedPalette(state: this, data: _data, child: widget.child);
  }
}

class _InheritedPalette extends InheritedWidget {
  const _InheritedPalette({
    Key? key,
    required this.state,
    required this.data,
    required child,
  }) : super(key: key, child: child);

  final PaletteProviderState state;

  final PaletteProviderData data;

  @override
  bool updateShouldNotify(_InheritedPalette oldWidget) {
    return data != oldWidget.data;
  }
}
