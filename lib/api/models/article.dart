
import 'package:news_list/api/models/image.dart';

class Article {
  String title;
  String id;
  String slug;
  String content;
  bool hosted;
  String sourceUrl;
  Image image;

  Article(
      {this.title,
        this.id,
        this.slug,
        this.content,
        this.hosted,
        this.sourceUrl,
        this.image});

  Article.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    id = json['id'];
    slug = json['slug'];
    content = json['content'];
    hosted = json['hosted'];
    sourceUrl = json['sourceUrl'];
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['id'] = this.id;
    data['slug'] = this.slug;
    data['content'] = this.content;
    data['hosted'] = this.hosted;
    data['sourceUrl'] = this.sourceUrl;
    if (this.image != null) {
      data['image'] = this.image.toJson();
    }
    return data;
  }
}