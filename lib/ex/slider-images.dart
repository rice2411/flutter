import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

class sliderImages extends StatelessWidget {
  sliderImages({Key? key}) : super(key: key);
  List<String> images = [
    "assets/images/sushi/1.png",
    "assets/images/sushi/2.png",
    "assets/images/sushi/3.png",
    "assets/images/sushi/4.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 3,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(children: [
          ...images.map((e) {
            return Container(
              margin: EdgeInsets.all(10),
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(image: AssetImage(e), fit: BoxFit.cover),
              ),
              child: Column(
                children: [Text("asjdi")],
              ),
            );
          }).toList()
        ]),
      ),
    );
  }
}
