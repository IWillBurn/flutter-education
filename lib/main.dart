import 'package:flutter/material.dart';
import 'package:flutter_education/screens/news_screen.dart';
import 'package:flutter_education/themes/theme_changer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeChanger(
      builder: (context, theme, changeTheme) {
        return MaterialApp(
          title: 'News App',
          theme: theme,
          home: NewsScreen(changeTheme: changeTheme),
        );
      },
    );
  }
}