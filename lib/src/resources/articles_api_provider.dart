import 'dart:convert';

import 'package:ny_news_flutter/src/models/article.dart';
import 'package:http/http.dart' as http;
import 'Repository.dart';

class ArticlesApiProvider implements Source {
  final String _baseurl = 'api.nytimes.com';
  static const String API_KEY = 'ahOr1WTkkfVTUwtwGVU4qhYxE39PurKH';

  @override
  Future<List<Article>> searchArticles(String searchQuery) async {
    List<Article> articles = new List.empty(growable: true);
    Map<String, String> parameters = {'api-key': API_KEY, 'q': searchQuery};
    Uri uri =
        Uri.https(_baseurl, '/svc/search/v2/articlesearch.json', parameters);

    try {
      var response = await http.get(uri);
      Map<String, dynamic> data = json.decode(response.body);
      // data['results']
      //     .forEach((articleMap) => articles.add(Article.fromJson(articleMap)));
      List<dynamic> dataList = data['response']['docs'];

      dataList.forEach((element) {
        articles.add(Article.fromSearchJson(element));
      });
    } catch (err) {
      throw err.toString();
    }

    return articles;
  }

  @override
  Future<List<Article>> fetchPopular(String articlesType, String period) async {
    List<Article> articles = new List.empty(growable: true);
    Map<String, String> parameters = {'api-key': API_KEY};
    Uri uri =
        Uri.https(_baseurl, '/svc/mostpopular/v2/$articlesType/$period.json', parameters);

    try {
      var response = await http.get(uri);
      Map<String, dynamic> data = json.decode(response.body);
      // data['results']
      //     .forEach((articleMap) => articles.add(Article.fromJson(articleMap)));
      List<dynamic> dataList = data['results'];

      dataList.forEach((element) {
        articles.add(Article.fromJson(element));
      });
    } catch (err) {
      throw err.toString();
    }

    return articles;
  }
}
