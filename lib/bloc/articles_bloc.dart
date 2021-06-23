import 'package:flutter/foundation.dart';
import 'package:news_list/api/api_client.dart';
import 'package:news_list/api/resource.dart';
import 'package:news_list/bloc/base/base_bloc.dart';
import 'package:news_list/bloc/base/bloc_event.dart';
import 'package:news_list/bloc/base/bloc_state.dart';

class ArticlesBloc extends BaseBloc<BlocEvent,BlocState>{
  final Repository _repository;

  ArticlesBloc({@required Repository repository})
      : assert(repository != null),
      _repository = repository,
      super(ArticlesLoadingInProgress());


  @override
  Stream<BlocState> mapEventToState(BlocEvent event) async* {
    if(event is ArticleFetchStarted){
        yield ArticlesLoadingInProgress();
        final response = await _repository.getArticles();
        if(response.status == Status.COMPLETED){
          yield ArticlesLoadSuccess(response.data);
        }else if(response.status == Status.ERROR){
          yield ArticlesLoadFailure();
        }
    }
  }
  
}