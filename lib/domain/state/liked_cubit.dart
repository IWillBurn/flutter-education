import 'package:flutter_bloc/flutter_bloc.dart';
import '../../internal/repositories.dart';
import '../../internal/settings.dart';
import '../entities/news.dart';

class LikedCubit extends Cubit<Map<String, News>> {
  LikedCubit() : super({});

  void changeLikeNews(News news)  {
    if (news.title == null) {
      return;
    }
    if (state[news.title] != null) {
      String title = news.title ?? "-";
      state.remove(title);
      news.isFavorite = true;
    }
    else{
      String title = news.title ?? "-";
      state[title] = news;
      news.isFavorite = false;
    }
  }

}