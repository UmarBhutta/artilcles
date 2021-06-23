
import 'package:news_list/api/models/Publisher.dart';
import 'package:news_list/api/models/image.dart';

class Article {
  String title;
  String id;
  String slug;
  String content;
  bool hosted;
  String sourceUrl;
  Publisher publisher;
  ArticleImage image;

  Article(
      {this.title,
        this.id,
        this.slug,
        this.content,
        this.hosted,
        this.sourceUrl,
        this.publisher,
        this.image});

  Article.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    id = json['id'];
    slug = json['slug'];
    content = json['content'];
    hosted = json['hosted'];
    sourceUrl = json['sourceUrl'];
    publisher = json['publisher'] != null ? Publisher.fromJson(json['publisher']) : null;
    image = json['image'] != null ?  ArticleImage.fromJson(json['image']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['title'] = this.title;
    data['id'] = this.id;
    data['slug'] = this.slug;
    data['content'] = this.content;
    data['hosted'] = this.hosted;
    data['sourceUrl'] = this.sourceUrl;
    if(this.publisher != null){
      data['publisher'] = this.publisher.toJson();
    }
    if (this.image != null) {
      data['image'] = this.image.toJson();
    }
    return data;
  }
}