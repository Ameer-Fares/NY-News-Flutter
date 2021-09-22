import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ny_news_flutter/src/blocs/articles_provider.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late String searchText = '';

  changeText(String value) {
    setState(() {
      searchText = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Search'),
        ),
      ),
      body: Column(
        children: [
          TextField(
            autofocus: true,
            onChanged: (value) => changeText(value),
            decoration: InputDecoration(hintText: 'Search'),
          ),
          ElevatedButton(
            child: Text('Submit'),
            onPressed: searchText.isNotEmpty
                ? () {
                    final bloc = ArticlesProvider.of(context);
                    bloc.searchArticles(searchText);
                    Navigator.pushNamed(context, '/articleslist');
                  }
                : () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("please input search query"),
                    ));
                  },
          )
        ],
      ),
    );
  }
}
