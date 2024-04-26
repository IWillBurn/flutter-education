import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_education/domain/state/articles_cubit.dart';
import '../../domain/entities/news.dart';
import '../../domain/state/liked_cubit.dart';
import 'article_details_screen.dart';

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
      body: Builder(
        builder: (context) {
          final stateArticles = context.watch<ArticlesCubit>().state;
          final stateLiked = context.watch<LikedCubit>().state;
          return CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                title: const Text('News'),
                floating: true,
                actions: [
                  IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {},
                  ),
                ],
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    News article;
                    if (stateArticles.length > index) {
                      article = stateArticles[index];
                    } else {
                      article = News(
                          author: null,
                          title: null,
                          url: null,
                          publishedAt: null,
                          content: null,);
                    }
                    final title = article.title ?? 'No Title';
                    final description = article.description ?? 'No Description';
                    if (article.title != null) {
                      return Column(
                        children: [
                          ListTile(
                            title: Text(
                              title,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.fontFamily,),
                            ),
                            subtitle: Text(
                              description,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: Theme.of(context)
                                      .textTheme
                                      .displaySmall
                                      ?.fontFamily,),
                            ),
                            onTap: () =>
                                _navigateToDetailsPage(article, context),
                          ),
                          TweenAnimationBuilder(
                            duration: const Duration(milliseconds: 500),
                            tween: Tween<double>(
                              begin:
                                  stateLiked[article.title] != null ? 0.5 : 1,
                              end: stateLiked[article.title] != null ? 1 : 0.5,
                            ),
                            builder: (BuildContext context, double value,
                                Widget? child,) {
                              return Opacity(opacity: value, child: child);
                            },
                            child: IconButton(
                              icon: Icon(
                                Icons.favorite_sharp,
                                color: Colors.red[500],
                              ),
                              onPressed: () => context
                                  .read<LikedCubit>()
                                  .changeLikeNews(article),
                            ),
                          ),
                        ],
                      );
                    } else {
                      return null;
                    }
                  }),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
