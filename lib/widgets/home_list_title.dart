import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ny_news_flutter/src/blocs/articles_provider.dart';

class HomeListTitle extends StatelessWidget {
  late String title;
  late String path;

  HomeListTitle({required this.title, required this.path});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.black, width: 0.1),
            borderRadius: BorderRadius.circular(10)),
        child: ListTile(
            title: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            trailing: Icon(Icons.navigate_next),
            onTap: () {
              if (path.contains('articleslist')) {
                var bloc = ArticlesProvider.of(context);
                bloc.fetchPopular(title, '1');
              }
              Navigator.pushNamed(context, path);
            }),
      ),
    );
  }
}
