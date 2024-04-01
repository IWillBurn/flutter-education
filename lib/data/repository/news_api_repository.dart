import 'package:flutter_education/domain/entities/news.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositories/news_repository.dart';
import '../api/services/news_api_service.dart';

@Injectable(as: NewsRepository)
class NewsApiRepository implements NewsRepository {

  final NewsApiService apiService;
  const NewsApiRepository({required this.apiService});

  @override
  Future<List<News>> getArticles() async {
    var articlesModels = await apiService.getArticles();
    return articlesModels.map((item) => item.fromModel()).toList();
  }
}