import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import 'package:flutter_rice_app/model/NewsModel.dart';

class NewsItemDetail extends StatelessWidget {
  NewsItemDetail({required this.item});

  final NewsModel item;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10), // Image border
              child: SizedBox.fromSize(
                // Image radius
                child: Image.network(
                    item.urlToImage ??
                        "https://elitebba.com/wp-content/uploads/2017/04/default-image.jpg",
                    fit: BoxFit.cover),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              item.title ?? "",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(
              height: 5,
            ),
            Html(data: item.content)
          ],
        ),
      ),
    ]);
  }
}
