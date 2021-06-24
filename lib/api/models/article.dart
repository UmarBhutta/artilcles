
import 'package:news_list/api/models/Publisher.dart';
import 'package:news_list/api/models/category.dart';
import 'package:news_list/api/models/image.dart';

class Article {
  String title;
  String id;
  String slug;
  String content;
  bool hosted;
  String sourceUrl;
  Publisher publisher;
  String publishDate;
  ArticleImage image;
  List<Category> categories;

  Article(
      {this.title,
        this.id,
        this.slug,
        this.content,
        this.hosted,
        this.sourceUrl,
        this.publisher,
        this.publishDate,
        this.image,
        this.categories});

  Article.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    id = json['id'];
    slug = json['slug'];
    content = json['content'];
    hosted = json['hosted'];
    sourceUrl = json['sourceUrl'];
    publisher = json['publisher'] != null ? Publisher.fromJson(json['publisher']) : null;
    publishDate = json['_publishedAt'];
    image = json['image'] != null ?  ArticleImage.fromJson(json['image']) : null;
    if( json['categories'] != null ){
      categories = [];
      json['categories'].forEach((value){
        categories.add(Category.fromJson(value));
      });
    }
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
    data['_publishedAt'] = this.publishDate;
    if (this.image != null) {
      data['image'] = this.image.toJson();
    }
    if (this.categories != null) {
      data['categories'] = this.categories.map((v) => v.toJson()).toList();
    }
    return data;
  }
}