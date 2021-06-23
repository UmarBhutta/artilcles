import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_list/api/models/article.dart';
import 'package:news_list/bloc/article_details_bloc.dart';
import 'package:news_list/bloc/articles_bloc.dart';
import 'package:news_list/bloc/base/bloc_event.dart';
import 'package:news_list/bloc/base/bloc_state.dart';
import 'package:news_list/ui/article_details.dart';
import 'package:news_list/ui/base/show_details.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticlesPage extends StatelessWidget implements LoadDetails,LoadUrl{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Articles')),
      body: Center(
        child: BlocBuilder<ArticlesBloc, BlocState>(
          builder: (context, state) {
            if (state is ArticlesLoadingInProgress) {
              return CircularProgressIndicator();
            } else if (state is ArticlesLoadSuccess) {
              return ListView.builder(
                itemCount: state.articles.length,
                itemBuilder: (context, index) {
                  final article = state.articles[index];
                  return InkWell(child:ListTile(
                    key: Key(article.id),
                    leading: Icon(Icons.article),
                    title: Text(article.title,),
                    trailing: Icon(
                      article.hosted == true ? Icons.details : Icons.travel_explore,
                      color: Colors.blueAccent,
                    ),
                    subtitle: article.content != null
                        ? Text(article.content,maxLines: 5,)
                        : null,
                  ),onTap: () => _selectArticle(context,article),);
                },
              );
            } else {
              return Text('Oops something went wrong!');
            }
          },
        ),
      ),
    );
  }

  _selectArticle(BuildContext context,Article article){
    if(article.hosted){
      openDetailsScreen(context,article);
    }else{
      openUrlInBrowser(article.sourceUrl);
    }
  }

  @override
  void openDetailsScreen(BuildContext context,Article article) {
    final route = MaterialPageRoute(builder: (context) => BlocProvider(
      create: (_) => ArticleDetailsBloc()..add(ArticleSelected(article: article)),
      child: Details(title: article.title,),
    ));
    Navigator.push(context, route);
  }

  @override
  void openUrlInBrowser(String url) async{
    await canLaunch(url) ? await launch(url) : throw 'Could not launch';
  }
}