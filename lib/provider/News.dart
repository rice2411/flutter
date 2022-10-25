import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:flutter_rice_app/model/NewsModel.dart';

class NewsProvider extends ChangeNotifier {
  List<NewsModel> list = [];
  void getList(String cate) async {
    String apiUrl =
        "https://newsapi.org/v2/everything?q=$cate&from=2022-09-18&sortBy=publishedAt&apiKey=4520d6e33b2a43ee9b51a5e71cde0d22";
    var client = http.Client();
    var jsonString = await client.get(Uri.parse(apiUrl));
    var jsonObject = jsonDecode(jsonString.body);
    var newListObject = jsonObject['articles'] as List;
    list = newListObject.map((e) {
      return NewsModel.fromJson(e);
    }).toList();
    notifyListeners();
  }
}
