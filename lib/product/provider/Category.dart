import 'dart:convert';

import 'package:flutter_rice_app/product/model/Product.dart';
import 'package:flutter_rice_app/product/model/Rate.dart';
import 'package:flutter_rice_app/product/service/Product.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

class CategoryProvider extends ChangeNotifier {
  List<dynamic> list = [];

  void getList() async {
    String apiUrl = ProductService.GetListCategory;

    var client = http.Client();
    var jsonString = await client.get(Uri.parse(apiUrl));
    var jsonObject = jsonDecode(jsonString.body);

    list = jsonObject;
    list.insert(0, "All");
    notifyListeners();
  }
}
