import 'package:flutter/material.dart';
import 'package:ny_news_flutter/screens/ArticlesPage.dart';
import 'package:ny_news_flutter/screens/HomePage.dart';
import 'package:ny_news_flutter/screens/SearchPage.dart';
import 'package:ny_news_flutter/src/blocs/articles_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ArticlesProvider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'NYT',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: routes,
      ),
    );
  }

  Route routes(RouteSettings settings) {
    if (settings.name == '/') {
      return MaterialPageRoute(
        builder: (context) {
          return HomePage(title: 'NYT');
        },
      );
    } else if (settings.name == '/search') {
      return MaterialPageRoute(
        builder: (context) {
          return SearchPage();
        },
      );
    } else if (settings.name == '/articleslist') {
      return MaterialPageRoute(
        builder: (context) {
          return ArticlesPage();
        },
      );
    } else {
      return MaterialPageRoute(
        builder: (context) {
          return HomePage(title: 'NYT');
        },
      );
    }
  }
}
