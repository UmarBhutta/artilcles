import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_list/api/api_client.dart';
import 'package:news_list/bloc/articles_bloc.dart';
import 'package:news_list/bloc/base/bloc_event.dart';
import 'package:news_list/ui/article_list.dart';

void main() => runApp(MyApp(repository: NetworkRepository.create()));

class MyApp extends StatelessWidget {
  const MyApp({Key key, @required this.repository})
      : assert(repository != null),
        super(key: key);

  final Repository repository;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (_) => ArticlesBloc(
          repository: repository,
        )..add(ArticleFetchStarted()),
        child: ArticlesPage(),
      ),
    );
  }
}

