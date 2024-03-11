import 'package:flutter/material.dart';
import 'dart:convert';
import '../dto/news.dart';
import '../themes/themes.dart';
import 'article_details_screen.dart';

import 'package:http/http.dart' as http;

class NewsScreen extends StatefulWidget {
  final Function(ThemeData) changeTheme;

  const NewsScreen({super.key, required this.changeTheme});

  @override
  NewsScreenState createState() => NewsScreenState();
}

class NewsScreenState extends State<NewsScreen> {
  final String apiKey = 'b265ce05bedf498fadd45fb87586e316';
  final String apiUrl = 'https://newsapi.org/v2/top-headlines?country=us';

  List<News> articles = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('$apiUrl&apiKey=$apiKey'));

    if (response.statusCode == 200) {
      setState(() {
        List<dynamic> data = json.decode(response.body)['articles'];
        articles = [];
        for (int i = 0; i < data.length; i++) {
          articles.add(News.fromJson(data[i]));
        }
      });
    } else {
      throw Exception('Failed to load articles');
    }
  }

  void _navigateToDetailsPage(News article) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ArticleDetailsScreen(article: article),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_4),
            onPressed: () {
              if (Theme.of(context).brightness == Brightness.light) {
                widget.changeTheme(darkTheme);
              } else {
                widget.changeTheme(lightTheme);
              }
            },
          ),
        ],
      ),
      body: ListView.separated(
        itemCount: articles.length,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: 16);
        },
        itemBuilder: (context, index) {
          final article = articles[index];
          final title = article.title ?? 'No Title';
          final description = article.description ?? 'No Description';

          return ListTile(
            title: Text(
              title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily: Theme.of(context).textTheme.displayMedium?.fontFamily),
            ),
            subtitle: Text(
              description,
              style: TextStyle(fontSize: 16, fontFamily: Theme.of(context).textTheme.displaySmall?.fontFamily),
            ),
            onTap: () => _navigateToDetailsPage(article),
          );
        },
      ),
    );
  }
}