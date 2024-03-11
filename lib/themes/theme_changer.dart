import 'package:flutter/material.dart';
import 'package:flutter_education/themes/themes.dart';

class ThemeChanger extends StatefulWidget {
  final Widget Function(
      BuildContext context,
      ThemeData theme,
      Function(ThemeData) changeTheme,
      ) builder;

  const ThemeChanger({super.key, required this.builder});

  @override
  State<ThemeChanger> createState() => _ThemeChangerState();

  static State<ThemeChanger> of(BuildContext context) {
    return context.findAncestorStateOfType<State<ThemeChanger>>()!;
  }
}

class _ThemeChangerState extends State<ThemeChanger> {
  ThemeData _themeData = lightTheme;

  void changeTheme(ThemeData themeData) {
    setState(() {
      _themeData = themeData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, _themeData, changeTheme);
  }
}