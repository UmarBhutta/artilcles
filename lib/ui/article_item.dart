import 'package:flutter/material.dart';
import 'package:news_list/api/models/article.dart';
import 'package:news_list/utils/image_view.dart';

class ArticleItem extends StatelessWidget{

  final Article article;
  final void Function(BuildContext context,Article article) callback;

  const ArticleItem({@required this.article,this.callback}) : assert(article != null);

  @override
  Widget build(BuildContext context) {
    return Card(
      key: Key(article.id),
      child:ListTile(
        leading: article.image != null ? NetworkImageView(articleImage: article.image,) : Container(height: 60, width: 60,child:Center(child:Icon(Icons.article,color: Colors.blueAccent,size: 30,))),
        title: Text(article.title, style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(color: Colors.blue)),),
        trailing: Icon(
          article.hosted == true ? Icons.details : Icons.travel_explore,
          color: Colors.blueAccent,
        ),
        subtitle: article.publisher != null
            ? Padding(child: Text(article.publisher.name,style: Theme.of(context).textTheme.subtitle2,),padding: EdgeInsets.only(top: 4,bottom: 4),)
            : null,
        onTap: () => callback(context,article),
      ),);
  }

}