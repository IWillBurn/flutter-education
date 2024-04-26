import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../domain/entities/news.dart';

class ArticleDetailsScreen extends StatelessWidget {
  final News article;

  const ArticleDetailsScreen({super.key, required this.article});

  _launchURL(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Не удалось открыть ссылку $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title ?? 'No Title'),
      ),
      body: TweenAnimationBuilder(
        duration: const Duration(milliseconds: 500),
        tween: Tween<double>(begin: 0, end: 1),
        builder: (BuildContext context, double value, Widget? child) {
          return Opacity(opacity: value, child: child);
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (article.urlToImage != null)
                  Image.network(
                    article.urlToImage ?? "",
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (
                      BuildContext context,
                      Object error,
                      StackTrace? stackTrace,
                    ) {
                      return Container(
                        color: Colors.grey,
                        height: 200,
                        width: double.infinity,
                        child: const Icon(Icons.error, color: Colors.white),
                      );
                    },
                  ),
                const SizedBox(height: 16),
                Text(
                  article.title ?? 'No title',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily:
                        Theme.of(context).textTheme.displayMedium?.fontFamily,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Published at: ${article.publishedAt ?? 'Unknown'}',
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily:
                        Theme.of(context).textTheme.displaySmall?.fontFamily,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Author: ${article.author ?? 'Unknown'}',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily:
                        Theme.of(context).textTheme.displaySmall?.fontFamily,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Description:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily:
                        Theme.of(context).textTheme.displayMedium?.fontFamily,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  article.description ?? 'No Description',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily:
                        Theme.of(context).textTheme.displaySmall?.fontFamily,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Content:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily:
                        Theme.of(context).textTheme.displayMedium?.fontFamily,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  article.content ?? 'No Content',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily:
                        Theme.of(context).textTheme.displaySmall?.fontFamily,
                  ),
                ),
                const SizedBox(height: 16),
                if (article.url != null)
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: () {
                        if (article.url != null) {
                          _launchURL(article.url ?? "");
                        }
                      },
                      child: const Text('Read More'),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
