import 'package:flutter/foundation.dart';

class Feeds{
  final String title;
  final String description;
  final String image;
  final String url;
  final DateTime publishedAt;

  Feeds({
    @required this.title,
    @required this.description,
    @required this.image,
    @required this.url,
    @required this.publishedAt
  });

  Feeds.fromMap(Map<String, dynamic> data)
  : title = data['title'],
    description = data['description'],
    image = data['urlToImage'],
    url = data['url'],
    publishedAt = DateTime.tryParse(data['publishedAt']).toUtc();


  Map<dynamic, dynamic> toJson(){
    return {
      'title' : title,
      'description' : description,
      'image' : image,
      'url' : url,
      'publishedAt' : publishedAt,
    };
  }

}