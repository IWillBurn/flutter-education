import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  primarySwatch: Colors.blue,
  colorScheme: const ColorScheme.light(primary: Colors.blue),
  textTheme: const TextTheme(
      displayMedium: TextStyle(fontFamily: "arial"),
      displaySmall: TextStyle(fontFamily: "arial"),),
);

final ThemeData darkTheme = ThemeData(
  primarySwatch: Colors.indigo,
  colorScheme: const ColorScheme.dark(primary: Colors.indigo),
  textTheme: const TextTheme(
      displayMedium: TextStyle(fontFamily: "arial"),
      displaySmall: TextStyle(fontFamily: "arial"),),
);
