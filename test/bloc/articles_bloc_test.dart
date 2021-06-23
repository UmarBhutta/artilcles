
import 'dart:convert';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:news_list/api/api_client.dart';
import 'package:news_list/api/models/article.dart';
import 'package:news_list/api/resource.dart';
import 'package:news_list/bloc/articles_bloc.dart';
import 'package:news_list/bloc/base/bloc_event.dart';
import 'package:news_list/bloc/base/bloc_state.dart';

import '../mock_repo.dart';




void main(){
  group('Articles Bloc', (){
    Repository repository;
    ArticlesBloc articlesBloc;

    //mock data
    final articleJson = jsonDecode(jsonData)['data'];
    final data = articleJson['allArticles'] as List;

    setUp((){
      repository = MockGraphQlApiClient();
      articlesBloc = ArticlesBloc(repository: repository);
    });
    
    
    group('Articles Requested', (){
      blocTest('emit ArticlesLoadingInProgress, ArticlesLoadSuccess when ArticleFetchStarted is added and getArticles succeed', build: (){
        when(repository.getArticles()).thenAnswer((realInvocation) => Future.value(Resource.completed(data.map((e) => Article.fromJson(e)).toList())));

        return articlesBloc;
      },
      act: (bloc) => bloc.add(ArticleFetchStarted()),
      expect: () =>[
        ArticlesLoadingInProgress(),
        ArticlesLoadSuccess(data.map((e) => Article.fromJson(e)).toList())
      ],
      );

      blocTest('emit ArticlesLoadingInProgress, ArticlesLoadFailure when ArticleFetchStarted is added and getArticles failed', build: (){
        when(repository.getArticles()).thenAnswer((realInvocation) => Future.value(Resource.error("Something went wrong")));

        return articlesBloc;
      },
        act: (bloc) => bloc.add(ArticleFetchStarted()),
        expect: () =>[
          ArticlesLoadingInProgress(),
          ArticlesLoadFailure()
        ],
      );
      
    });
    
  });
}

