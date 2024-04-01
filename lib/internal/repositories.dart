import 'package:injectable/injectable.dart';

import '../domain/repositories/news_repository.dart';

@injectable
class Repositories {
  final NewsRepository newsRepository;
  const Repositories({required this.newsRepository});
}