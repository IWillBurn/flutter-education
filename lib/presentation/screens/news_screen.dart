import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_education/domain/state/articles_cubit.dart';
import '../../domain/entities/news.dart';
import '../../domain/state/liked_cubit.dart';
import 'article_details_screen.dart';

import 'package:http/http.dart' as http;

class NewsScreen extends StatelessWidget {

  const NewsScreen({super.key});

  void _navigateToDetailsPage(News article, BuildContext context) {
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
        title: const Text('News'),
      ),
      body: BlocBuilder<ArticlesCubit, List<News>>(
        builder: (context, state) {
            return ListView.separated(
              itemCount: state.length,
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 16);
              },
              itemBuilder: (context, index) {
                final article = state[index];
                final title = article.title ?? 'No Title';
                final description = article.description ?? 'No Description';
                if (article.title != null) {
                  return Column(
                    children: [
                      ListTile(
                        title: Text(
                          title,
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily: Theme.of(context).textTheme.displayMedium?.fontFamily),
                        ),
                        subtitle: Text(
                          description,
                          style: TextStyle(fontSize: 16, fontFamily: Theme.of(context).textTheme.displaySmall?.fontFamily),
                        ),
                        onTap: () => _navigateToDetailsPage(article, context),
                      ),
                      IconButton(
                        icon: Icon(
                          article.isFavorite ? Icons.favorite_border : Icons.favorite_sharp,
                          color: Colors.red,
                        ),
                        onPressed: () => context.read<LikedCubit>().changeLikeNews(article),
                      ),
                    ],
                  );
                }
                else{
                  return null;
                }

              },
            );
        },
      ),
    );
  }
}