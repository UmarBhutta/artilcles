import 'package:cached_network_image/cached_network_image.dart';
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
                child: Column(
                  children: [
                    if(state.article.image != null) CachedNetworkImage(imageUrl: state.article.image.url,fit: BoxFit.fill,),
                    Padding(padding: EdgeInsets.only(left: 16,right: 16,top: 16),child:Text(state.article?.title,style: Theme.of(context).textTheme.headline5.merge(TextStyle(color: Colors.blue)),) ,),
                    Padding(padding: EdgeInsets.all(16),child:Text(state.article?.content,style: Theme.of(context).textTheme.bodyText1,) ,),
                  ],
                )
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