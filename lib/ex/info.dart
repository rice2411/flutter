import 'package:flutter/material.dart';
import 'package:flutter_rice_app/ex/category.dart';
import 'package:flutter_rice_app/ex/slider-images.dart';

class Info extends StatelessWidget {
  const Info({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    blockImage() {
      return Column(
        children: [Image.asset("assets/images/sushi/1.png")],
      );
    }

    blockTitle() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Osechinen Lake Campground",
                  style: TextStyle(fontWeight: FontWeight.w600)),
              Text("Kandersteg, Switzerland",
                  style: TextStyle(color: Colors.grey))
            ],
          ),
          Row(
            children: [Icon(Icons.star, color: Colors.red), Text("41")],
          )
        ],
      );
    }

    iconStyle(icon, text, color) {
      return TextButton(
        onPressed: () {},
        //style: ButtonStyle(overlayColor: Colors.white),
        child: Container(
          child: Column(children: [
            Icon(
              icon,
              color: color,
            ),
            Text(
              text,
              style: TextStyle(color: color),
            ),
          ]),
        ),
      );
    }

    blockIcon() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          iconStyle(Icons.phone, "CALL", Colors.blue),
          iconStyle(Icons.near_me, "ROUTE", Colors.blue),
          iconStyle(Icons.share, "SHARE", Colors.blue)
        ],
      );
    }

    blockDescription() {
      return Container(
        margin: EdgeInsets.all(50),
        child: Row(
          children: [
            Flexible(
              child: Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
            )
          ],
        ),
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            sliderImages(),
            sliderCategory(),
            blockImage(),
            SizedBox(height: 20),
            blockTitle(),
            SizedBox(height: 20),
            blockIcon(),
            blockDescription(),
          ],
        ),
      ),
    );
  }
}
