import 'package:flutter/material.dart';
import 'package:flutter_rice_app/provider/News.dart';
import 'package:provider/provider.dart';
import 'package:flutter_rice_app/provider/News.dart';

class sliderCategory extends StatefulWidget {
  final NewsProvider provider;
  final void Function(String cate) setCategory;

  sliderCategory({
    Key? key,
    required this.provider,
    required this.setCategory,
  }) : super(key: key);

  @override
  State<sliderCategory> createState() => _sliderCategoryState();
}

class _sliderCategoryState extends State<sliderCategory> {
  List<String> categories = [
    "Apple",
    "Tesla",
  ];
  String categorySelected = "";
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(children: [
          ...categories.map((e) {
            return TextButton(
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(Colors.transparent),
                padding:
                    MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(0)),
              ),
              onPressed: () {
                widget.setCategory(e.toLowerCase());
              },
              child: Container(
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                    color: categorySelected == e ? Colors.white : Colors.black,
                    borderRadius: BorderRadius.circular(20),
                    border: categorySelected == e
                        ? Border.all(color: Colors.black)
                        : Border.all(color: Colors.white)),
                child: Text(
                  e,
                  style: TextStyle(
                      color:
                          categorySelected == e ? Colors.black : Colors.white),
                ),
              ),
            );
          }).toList()
        ]),
      ),
    );
  }
}
