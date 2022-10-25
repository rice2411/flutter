import 'package:flutter/material.dart';

import 'package:flutter_rice_app/model/NewsModel.dart';
import 'package:flutter_rice_app/pages/news_item_detail.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({required this.item});

  final NewsModel item;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => NewsItemDetail(item: item)));
      },
      child: Container(
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
            Text(
              item.description ?? "",
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
