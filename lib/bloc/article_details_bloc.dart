import 'package:news_list/bloc/base/base_bloc.dart';
import 'package:news_list/bloc/base/bloc_event.dart';
import 'package:news_list/bloc/base/bloc_state.dart';

class ArticleDetailsBloc extends BaseBloc<BlocEvent,BlocState>{

  ArticleDetailsBloc() : super(ArticleDetailsLoadingInProgress());

  @override
  Stream<BlocState> mapEventToState(BlocEvent event) async*{
    if(event is ArticleSelected){
       yield ArticleDetailsSuccess(event.article);
    }
  }

}