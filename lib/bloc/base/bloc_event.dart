
import 'package:flutter/cupertino.dart';
import 'package:news_list/api/models/article.dart';

@immutable
abstract class BlocEvent{}

class ArticleFetchStarted extends BlocEvent{}

class ArticleSelected extends BlocEvent{
  final Article article;

  ArticleSelected({@required this.article}) : assert(article != null);
}