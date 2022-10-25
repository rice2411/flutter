import 'package:flutter/material.dart';
import 'package:flutter_rice_app/product/provider/Category.dart';
import 'package:flutter_rice_app/provider/News.dart';
import 'package:provider/provider.dart';
import 'package:flutter_rice_app/provider/News.dart';

class SliderCategory extends StatefulWidget {
  SliderCategory({
    required this.category,
    required this.setCategory,
  });

  late final String category;
  final void Function(String cate) setCategory;

  @override
  State<SliderCategory> createState() => _SliderCategoryState();
}

class _SliderCategoryState extends State<SliderCategory> {
  @override
  Widget build(BuildContext context) {
    var categoryProvider = Provider.of<CategoryProvider>(context);
    categoryProvider.getList();

    return Container(
      width: double.infinity,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(children: [
          ...categoryProvider.list.map((e) {
            return TextButton(
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(Colors.transparent),
                padding:
                    MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(0)),
              ),
              onPressed: () {
                widget.setCategory(e);
              },
              child: Container(
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: widget.category == e
                      ? Color(0xff3E3E70)
                      : Color(0xfff0f0f5),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  e,
                  style: TextStyle(
                      color: widget.category == e ? Colors.white : Colors.grey),
                ),
              ),
            );
          }).toList()
        ]),
      ),
    );
  }
}
