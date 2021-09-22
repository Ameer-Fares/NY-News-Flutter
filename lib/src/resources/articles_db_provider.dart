import 'package:ny_news_flutter/src/models/article.dart';
import 'package:ny_news_flutter/src/resources/Repository.dart';

class ArticlesDbProvider implements Source, Cache {


  @override
  Future<List<Article>> searchArticles(String searchQuery) async {
    List<Article> articles = new List.empty(growable: true);

    return articles;
  }

  @override
  Future<List<Article>> fetchPopular(String articalType, String period) async {
    List<Article> articles = new List.empty(growable: true);

    return articles;
  }
}
