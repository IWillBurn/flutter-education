import 'package:flutter/material.dart';

import '../../dto/news.dart';
import '__image/article_detailed__image.dart';

class ArticleDetailed extends StatelessWidget {
  final News article;

  const ArticleDetailed({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ArticleDetailedImage(imageUrl: article.urlToImage),
              const SizedBox(height: 16),
              Text(
                article.title ?? 'No title',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily: Theme.of(context).textTheme.displayMedium?.fontFamily),
              ),
              const SizedBox(height: 4),
              Text(
                'Published at: ${article.publishedAt ?? 'Unknown'}',
                style: TextStyle(fontSize: 12, fontFamily: Theme.of(context).textTheme.displaySmall?.fontFamily),
              ),
              const SizedBox(height: 4),
              Text(
                'Author: ${article.author ?? 'Unknown'}',
                style: TextStyle(fontSize: 16, fontFamily: Theme.of(context).textTheme.displaySmall?.fontFamily),
              ),
              const SizedBox(height: 16),
              Text(
                'Description:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: Theme.of(context).textTheme.displayMedium?.fontFamily),
              ),
              const SizedBox(height: 4),
              Text(
                article.description ?? 'No Description',
                style: TextStyle(fontSize: 16, fontFamily: Theme.of(context).textTheme.displayMedium?.fontFamily),
              ),
              const SizedBox(height: 16),
              Text(
                'Content:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: Theme.of(context).textTheme.displayMedium?.fontFamily),
              ),
              const SizedBox(height: 4),
              Text(
                article.content ?? 'No Content',
                style: TextStyle(fontSize: 16, fontFamily: Theme.of(context).textTheme.displaySmall?.fontFamily),
              ),
            ],
          ),
        ),
    );
  }
}