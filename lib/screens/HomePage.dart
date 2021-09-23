import 'package:flutter/material.dart';
import 'package:ny_news_flutter/screens/SearchPage.dart';
import 'package:ny_news_flutter/src/blocs/articles_bloc.dart';
import 'package:ny_news_flutter/src/blocs/articles_provider.dart';
import 'package:ny_news_flutter/widgets/home_list_title.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  final menuItems = ['Most Viewed', 'Most Shared', 'Most Emailed'];
  late ArticlesBloc bloc;

  @override
  Widget build(BuildContext context) {
    bloc = ArticlesProvider.of(context);
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Center(child: Text(title)),
        ),
        body: ListView(
          children: [
            Container(height: 70),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Search',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            HomeListTitle(title: 'Search Articles', path: '/search'),
            Container(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Popular',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: menuItems.length,
              itemBuilder: (context, index) {
                return HomeListTitle(
                    title: menuItems[index], path: '/articleslist');
              },
            )
          ],
        ));
  }
}
