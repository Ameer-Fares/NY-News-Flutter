import 'package:ny_news_flutter/src/models/article.dart';
import 'package:ny_news_flutter/src/resources/Repository.dart';
import 'package:rxdart/rxdart.dart';

class ArticlesBloc {
  final _repo = Repository();

  ArticlesBloc() {
    //setup item fetcher if needed here
  }

  final _articlesList = PublishSubject<List<Article>>();

  Stream<List<Article>> get articlesList => _articlesList.stream;

  searchArticles(String query) async {
    var articlesList = await _repo.searchArticles(query);
    _articlesList.sink.add(articlesList);
  }

  fetchPopular(String articalType, String period) async {
    var type = '';
    switch (articalType) {
      case 'Most Viewed':
        type = 'viewed';
        break;
      case 'Most Shared':
        type = 'shared';
        break;
      case 'Most Emailed':
        type = 'emailed';
        break;
    }

    var articlesList = await _repo.fetchPopular(type, period);
    _articlesList.sink.add(articlesList);
  }
}
