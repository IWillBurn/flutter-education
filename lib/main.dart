import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_education/domain/state/articles_cubit.dart';
import 'package:flutter_education/domain/state/liked_cubit.dart';
import 'package:flutter_education/presentation/screens/favorites_screen.dart';
import 'package:flutter_education/presentation/themes/theme_changer.dart';
import 'internal/settings.dart';
import 'presentation/screens/news_screen.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
        bottom: const TabBar(
          tabs: [
            Tab(icon: Icon(Icons.import_contacts)),
            Tab(icon: Icon(Icons.favorite_sharp)),
          ],
     ),);
    return MaterialApp(
      title: 'News App',
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (BuildContext context) => ArticlesCubit(),),
          BlocProvider(
              create: (BuildContext context) => LikedCubit(),),
        ],
        child: DefaultTabController(
        length: 2, // Количество вкладок
        child: Scaffold(
          body: const TabBarView(
            children: [
              NewsScreen(),
              FavoritesScreen(),
            ],
          ),
          bottomNavigationBar: new SizedBox(
            height: appBar.preferredSize.height,
            child: appBar,
          ),
        ),
      ),
      ),
    );
  }
}