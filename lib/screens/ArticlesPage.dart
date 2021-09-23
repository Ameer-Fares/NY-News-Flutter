import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ny_news_flutter/src/blocs/articles_bloc.dart';
import 'package:ny_news_flutter/src/blocs/articles_provider.dart';
import 'package:ny_news_flutter/src/models/article.dart';
import 'package:ny_news_flutter/widgets/article_list_title.dart';
import 'package:ny_news_flutter/widgets/loading_container.dart';

class ArticlesPage extends StatelessWidget {
  late ArticlesBloc bloc;

  @override
  Widget build(BuildContext context) {
    bloc = ArticlesProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Articles'),
      ),
      body: StreamBuilder(
          stream: bloc.articlesList,
          builder: (context, AsyncSnapshot<List<Article>> snapshot) {
            if (!snapshot.hasData) return LoadingContainer();
            return ListView.separated(
                itemBuilder: (context, index) {
                  return ArticleListTitle(article: snapshot.data![index]);
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    thickness: 2,
                  );
                },
                itemCount: snapshot.data!.length);
          }),
    );
  }
}
