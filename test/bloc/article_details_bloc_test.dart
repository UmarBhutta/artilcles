
import 'dart:convert';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:news_list/api/models/article.dart';
import 'package:news_list/bloc/article_details_bloc.dart';
import 'package:news_list/bloc/base/bloc_event.dart';
import 'package:news_list/bloc/base/bloc_state.dart';

import '../mock_repo.dart';

void main(){



  group('Article Details Bloc', (){

    ArticleDetailsBloc articleDetailsBloc;

    //mock data
    final articleJson = jsonDecode(jsonData)['data'];
    final data = articleJson['allArticles'] as List;
    final parsedList = data.map((e) => Article.fromJson(e)).toList();
    
    setUp((){
      articleDetailsBloc = ArticleDetailsBloc();
    });
    
    group('Load Article Details', (){
      blocTest('emit ArticleDetailsLoadingInProgress, ArticleDetailsSuccess when ArticleSelected is added', build: (){
        return articleDetailsBloc;
      },
      act: (bloc) => bloc.add(ArticleSelected(article: parsedList[0])),
      expect: () => [
        ArticleDetailsLoadingInProgress(),
        ArticleDetailsSuccess(parsedList[0])
      ]);

    });
  });

}