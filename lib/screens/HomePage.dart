import 'package:flutter/material.dart';
import 'package:ny_news_flutter/screens/SearchPage.dart';
import 'package:ny_news_flutter/src/blocs/articles_bloc.dart';
import 'package:ny_news_flutter/src/blocs/articles_provider.dart';

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
            Text(
              'Search',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            ListTile(
                title: Text('Search Articles'),
                trailing: Icon(Icons.navigate_next),
                onTap: () => Navigator.pushNamed(context, '/search')),
            Container(
              height: 40,
            ),
            Text(
              'Popular',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            ListView.separated(
              separatorBuilder: (context, index) {
                return Divider(
                  color: Colors.black,
                );
              },
              shrinkWrap: true,
              itemCount: menuItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(menuItems[index]),
                  trailing: Icon(Icons.navigate_next),
                  onTap: () {
                    bloc.fetchPopular(menuItems[index],'1');
                    Navigator.pushNamed(context, '/articleslist');
                  },
                );
              },
            )
          ],
        ));
  }
}
