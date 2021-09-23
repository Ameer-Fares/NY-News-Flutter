import 'package:ny_news_flutter/src/models/article.dart';
import 'package:ny_news_flutter/src/resources/Repository.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'package:path/path.dart';

class ArticlesDbProvider implements Source, Cache {
  late Database db;
  final String ARTICLE_TABLE_NAME = 'articles';

  ArticlesDbProvider() {
    init();
  }

  void init() async {
    Directory directory = await getApplicationDocumentsDirectory();
    final path = join(directory.path, "nyt.db");
    db = await openDatabase(
      path,
      version: 1,
      onCreate: (Database newDb, int version) {
        newDb.execute("""
            CREATE TABLE $ARTICLE_TABLE_NAME
            (
              id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
              type TEXT,
              title TEXT,
              pub_date TEXT
            )
            """);
      },
    );
  }

  @override
  Future<int> addArticle(Article article) {
    return db.insert(
      ARTICLE_TABLE_NAME,
      article.toMap(),
      conflictAlgorithm: ConflictAlgorithm.ignore,
    );
  }

  @override
  Future<List<Article>> searchArticles(String searchQuery) async {
    List<Article> articles = new List.empty(growable: true);
    final maps = await db.rawQuery(
        'SELECT * FROM $ARTICLE_TABLE_NAME WHERE title LIKE $searchQuery');

    if (maps.length > 0) {
      maps.forEach((element) {
        articles.add(Article.fromDb(element));
      });
    }
    return articles;
  }

  @override
  Future<List<Article>> fetchPopular(String articleType, String period) async {
    List<Article> articles = new List.empty(growable: true);
    final maps = await db.query(
      ARTICLE_TABLE_NAME,
      columns: null,
      where: "type =?",
      whereArgs: [articleType],
    );

    if (maps.length > 0) {
      maps.forEach((element) {
        articles.add(Article.fromDb(element));
      });
    }
    return articles;
  }

  Future<int> clear() {
    return db.delete(ARTICLE_TABLE_NAME);
  }
}
