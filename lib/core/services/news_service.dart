
import 'dart:convert';

import 'package:blueconnectapp/core/models/feeds.dart';
import 'package:http/http.dart';

class NewsService {
  static const String _apiKey = '4cc11890aafa421aa1b5f3d0017c2ebe';

  static const String _url = 'http://newsapi.org/v2/top-headlines?country=us&apiKey=$_apiKey';

  // Fetch the news from the api
  Future<List<Feeds>> getNews() async {
    try{
      Response response = await get(_url);

      var responseData = jsonDecode(response.body);

      List<Feeds> data = [];

      if(response.statusCode == 200){
          data = responseData.map((e){
            return Feeds.fromMap(e);
          }).toList() as List<Feeds>;
      }
      return data;
    }catch(e){
      return e.message;
    }
  }
}