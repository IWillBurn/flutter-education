import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import '../../models/news_model.dart';

@injectable
class NewsApiService {
  final String _baseUrl = "https://newsapi.org/v2/top-headlines";
  final String _apiKey = "b265ce05bedf498fadd45fb87586e316";

  Future<List<NewsModel>> getArticles() async {
    final response = await http.get(Uri.parse("$_baseUrl?country=us&apiKey=$_apiKey"));
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      final List<dynamic> newsList = jsonData['articles'];
      return newsList.map((json) => NewsModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load top headlines');
    }
  }
}