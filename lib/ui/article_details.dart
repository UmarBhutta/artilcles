import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_list/bloc/article_details_bloc.dart';
import 'package:news_list/bloc/base/bloc_state.dart';

class Details extends StatelessWidget{

  final String title;

  const Details({@required this.title}) : assert(title != null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: BlocBuilder<ArticleDetailsBloc, BlocState>(
          builder: (context, state) {
            if (state is ArticleDetailsLoadingInProgress) {
              return CircularProgressIndicator();
            } else if (state is ArticleDetailsSuccess) {
              return SingleChildScrollView(
                child: Padding(padding: const EdgeInsets.all(16),
                child: Text(state.article?.content ?? "No item selected",style: Theme.of(context).textTheme.bodyText1,),),
              );
            } else {
              return Text('Oops something went wrong!');
            }
          },
        ),
      ),
    );
  }

}