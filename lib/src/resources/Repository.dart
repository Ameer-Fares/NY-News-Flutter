import 'package:ny_news_flutter/src/models/article.dart';

import 'articles_api_provider.dart';
import 'articles_db_provider.dart';

class Repository {
  List<Source> sources = <Source>[ArticlesApiProvider(), ArticlesDbProvider()];
  List<Cache> caches = <Cache>[ArticlesDbProvider()];

  Future<List<Article>> searchArticles(String searchQuery) async {
    List<Article> articlesList = List.empty(growable: true);
    Source source;
    for (source in sources) {
      articlesList = await source.searchArticles(searchQuery);
      if (articlesList.isNotEmpty) break;
    }
    for (var cache in caches) {
      articlesList.forEach((element) {
        cache.addArticle(element);
      });
    }

    return articlesList;
  }

  Future<List<Article>> fetchPopular(String articalType, String period) async {
    List<Article> articlesList = List.empty(growable: true);
    Source source;
    for (source in sources) {
      articlesList = await source.fetchPopular(articalType, period);

      if (articlesList.isNotEmpty) break;
    }
    for (var cache in caches) {
      articlesList.forEach((element) {
        cache.addArticle(element);
      });
    }

    return articlesList;
  }
}

abstract class Source {
  Future<List<Article>> searchArticles(String searchQuery);

  Future<List<Article>> fetchPopular(String articleType, String period);
}

abstract class Cache {
  Future<int> addArticle(Article article);

  Future<int> clear();
}
