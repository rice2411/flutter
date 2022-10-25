import 'package:flutter/material.dart';
import 'package:flutter_rice_app/ex/category.dart';
import 'package:flutter_rice_app/pages/news_item.dart';

import 'package:flutter_rice_app/provider/News.dart';
import 'package:provider/provider.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  String category = "";

  @override
  void initState() {
    super.initState();
    category = "tesla";
  }

  Widget build(BuildContext context) {
    var newsProvider = Provider.of<NewsProvider>(context);
    newsProvider.getList(category);

    void setCategory(String cate) {
      setState(() {
        category = cate;
      });
    }

    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          sliderCategory(provider: newsProvider, setCategory: setCategory),
          ...newsProvider.list.map((e) {
            return NewsItem(item: e);
          }).toList(),
        ],
      ),
    );
  }
}
