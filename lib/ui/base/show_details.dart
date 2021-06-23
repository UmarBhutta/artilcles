import 'package:flutter/cupertino.dart';
import 'package:news_list/api/models/article.dart';

abstract class LoadUrl{
  void openUrlInBrowser(String url);
}

abstract class LoadDetails{
  void openDetailsScreen(BuildContext context,Article article);
}