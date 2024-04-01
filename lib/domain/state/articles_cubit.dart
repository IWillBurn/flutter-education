import 'package:flutter_bloc/flutter_bloc.dart';
import '../../internal/repositories.dart';
import '../../internal/settings.dart';
import '../entities/news.dart';

class ArticlesCubit extends Cubit<List<News>> {
  ArticlesCubit() : super([]) {
    getNews();
  }

  Future<void> getNews() async {
    emit(
      await getIt.get<Repositories>().newsRepository.getArticles(),
    );
  }
}
