import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/news_data.dart';

class News {
  List<Article> articles = [];

  Future<void> getNews() async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=in&category=technology&apiKey=75cf40f03db2449085daa1ff19ebb042";

    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    if (jsonData["status"] == 'ok') {
      jsonData['articles'].forEach(
        (element) {
          if (element["urlToImage"] != null && element['description'] != null) {
            Article articleModel = Article(
              author: element['author'],
              title: element['title'],
              description: element['description'],
              url: element['url'],
              urlToImage: element['urlToImage'],
              content: element['content'],
            );
            articles.add(articleModel);
          }
        },
      );
    }
  }
}
