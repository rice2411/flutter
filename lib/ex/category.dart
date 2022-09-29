import 'package:flutter/material.dart';

class sliderCategory extends StatefulWidget {
  const sliderCategory({Key? key}) : super(key: key);

  @override
  State<sliderCategory> createState() => _sliderCategoryState();
}

class _sliderCategoryState extends State<sliderCategory> {
  List<String> categories = [
    "su",
    "su",
    "su",
    "su",
    "su",
    "su",
    "su",
    "su",
    "su",
    "su",
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
                setState(() {
                  categorySelected = e;
                });
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
