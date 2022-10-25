import 'package:flutter/material.dart';

import 'package:flutter_rice_app/product/helper/padding.dart';
import 'package:flutter_rice_app/product/model/Product.dart';
import 'package:flutter_rice_app/product/pages/home/category.dart';
import 'package:flutter_rice_app/product/pages/home/itemGrid.dart';
import 'package:flutter_rice_app/product/pages/home/itemList.dart';
import 'package:flutter_rice_app/product/provider/Product.dart';
import 'package:provider/provider.dart';

class Body extends StatefulWidget {
  Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String category = "";
  String keyword = "";
  bool? isGrid;
  bool isDesc = false;

  @override
  void initState() {
    super.initState();
    category = "All";
    keyword = "";
    isGrid = true;
    var productProvider = Provider.of<ProductProivder>(context, listen: false);
    productProvider.getList(
      category,
      keyword,
    );
  }

  @override
  Widget build(BuildContext context) {
    var productProvider = Provider.of<ProductProivder>(context);

    void setCategory(String cate) {
      setState(() {
        category = cate;
        productProvider.getList(
          cate,
          keyword,
        );
      });
    }

    buildGrid() {
      return Expanded(
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: MediaQuery.of(context).size.height / 1200,
          children: [
            ...productProvider.list.map((e) {
              return ItemGrid(item: e);
            }).toList(),
          ],
        ),
      );
    }

    buildList() {
      return Expanded(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            ...productProvider.list.map((e) {
              return ItemList(item: e);
            }).toList(),
          ],
        ),
      );
    }

    buildSearch() {
      return TextField(
        onSubmitted: (content) async {
          if (content != "") {
            setState(() {
              keyword = content;
              productProvider.getList(
                category,
                content,
              );
            });
          } else {
            setState(() {
              keyword = "";
              productProvider.getList(
                category,
                "",
              );
            });
          }
        },
        decoration: InputDecoration(
            hintText: "Search",
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all((Radius.circular(10))))),
      );
    }

    builView() {
      return productProvider.list.length > 0
          ? isGrid ?? true
              ? buildGrid()
              : buildList()
          : Text("Not thing to show");
    }

    void filterPrice(bool desc) async {
      productProvider.list.sort((a, b) {
        return desc
            ? a.price!.compareTo(b.price ?? 0)
            : b.price!.compareTo(a.price ?? 0);
      });
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: PaddingCustom.vertical,
        ),
        Text(
          "Discover unique furniture ",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        Text(
          "for your style ",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: PaddingCustom.vertical,
        ),
        buildSearch(),
        SizedBox(
          height: PaddingCustom.vertical,
        ),
        SliderCategory(category: category, setCategory: setCategory),
        SizedBox(
          height: PaddingCustom.vertical,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Most Interested",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                isGrid ?? false
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            isGrid = false;
                          });
                        },
                        icon: Icon(Icons.list_alt_sharp))
                    : IconButton(
                        onPressed: () {
                          setState(() {
                            isGrid = true;
                          });
                        },
                        icon: Icon(Icons.grid_view_sharp)),
                IconButton(
                    onPressed: () {
                      setState(() {
                        isDesc = !isDesc;
                        filterPrice(isDesc);
                      });
                    },
                    icon: Icon(Icons.sort_sharp))
              ],
            )
          ],
        ),
        SizedBox(
          height: PaddingCustom.vertical,
        ),
        builView(),
      ],
    );
  }
}
