import 'package:flutter_bloc/flutter_bloc.dart';
import '../entities/news.dart';

class LikedCubit extends Cubit<Map<String, News>> {
  LikedCubit() : super({});

  void changeLikeNews(News news)  {
    Map<String, News> newState = {};
    newState.addAll(state);
    if (news.title == null) {
      return;
    }
    if (newState[news.title] != null) {
      String title = news.title ?? "-";
      newState.remove(title);
    }
    else{
      String title = news.title ?? "-";
      newState[title] = news;
    }
    emit(newState);
  }

}