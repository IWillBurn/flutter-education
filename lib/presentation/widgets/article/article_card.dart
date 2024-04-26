import 'package:flutter/material.dart';

import '../../../domain/entities/news.dart';

class ArticleCard extends StatelessWidget {
  final News article;

  const ArticleCard({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            article.title ?? 'No Title',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: Theme.of(context).textTheme.displayMedium?.fontFamily,
            ),
          ),
          subtitle: Text(
            article.description ?? 'No Description',
            style: TextStyle(
              fontSize: 16,
              fontFamily: Theme.of(context).textTheme.displaySmall?.fontFamily,
            ),
          ),
          onTap: () => (),
        ),
        IconButton(
          icon: const Icon(
            Icons.favorite_border,
            color: Colors.red,
          ),
          onPressed: () => (),
        ),
      ],
    );
  }
}
