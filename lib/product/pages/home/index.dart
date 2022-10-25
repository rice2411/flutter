import 'package:flutter/material.dart';
import 'package:flutter_rice_app/product/pages/cart/index.dart';
import 'package:flutter_rice_app/product/helper/padding.dart';
import 'package:flutter_rice_app/product/pages/home/body.dart';

import 'package:flutter_rice_app/product/provider/Product.dart';

import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    AppBarIcon(icon, func) {
      return IconButton(
        padding: EdgeInsets.zero,
        constraints: BoxConstraints(),
        icon: Icon(icon, color: Colors.black),
        onPressed: () {
          func();
        },
      );
    }

    redirectToCart() {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Cart()));
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          primary: false,
          backgroundColor: Colors.white,
          elevation: 0,
          title: Row(
            children: [AppBarIcon(Icons.menu, null)],
          ),
          actions: [
            AppBarIcon(Icons.shopping_bag_outlined, redirectToCart),
            SizedBox(
              width: PaddingCustom.horizontal,
            ),
            AppBarIcon(Icons.notifications_outlined, null),
            SizedBox(
              width: PaddingCustom.horizontal,
            )
          ]),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: PaddingCustom.horizontal),
          child: Body(),
        ),
      ),
    );
  }
}
