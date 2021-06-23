import 'package:flutter/foundation.dart';
import 'package:news_list/api/models/article.dart';

@immutable
abstract class BlocState{}

class ArticlesLoadingInProgress extends BlocState{}

class ArticlesLoadSuccess extends BlocState{
  final List<Article> articles;

  ArticlesLoadSuccess(this.articles);
}

class ArticlesLoadFailure extends BlocState{}

class ArticleDetailsLoadingInProgress extends BlocState{}

class ArticleDetailsSuccess extends BlocState{
  final Article article;

  ArticleDetailsSuccess(this.article);

}