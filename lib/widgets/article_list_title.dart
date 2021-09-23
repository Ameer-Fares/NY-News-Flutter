import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ny_news_flutter/src/models/article.dart';

class ArticleListTitle extends StatelessWidget {
  late Article article;

  ArticleListTitle({required this.article});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        article.title,
        style: TextStyle(fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w600),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Text(article.pub_date),
      ),
    );
  }
}
