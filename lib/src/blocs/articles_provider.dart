import 'package:flutter/cupertino.dart';

import 'articles_bloc.dart';

class ArticlesProvider extends InheritedWidget {
  final ArticlesBloc bloc;

  ArticlesProvider({Key? key, required Widget child})
      : bloc = ArticlesBloc(),
        super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static ArticlesBloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<ArticlesProvider>())!
        .bloc;
  }
}
