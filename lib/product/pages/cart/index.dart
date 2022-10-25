import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_rice_app/product/pages/home/itemList.dart';
import 'package:flutter_rice_app/product/provider/Cart.dart';
import 'package:provider/provider.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  void initState() {
    super.initState();
    var cartProvider = Provider.of<CartProvider>(context, listen: false);
    cartProvider.getList();
  }

  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartProvider>(context);
    buildList() {
      return Expanded(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            ...cartProvider.list.map((e) {
              return ItemList(item: e);
            }).toList(),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
          primary: false,
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          actions: []),
      body: Column(children: [buildList()]),
    );
  }
}
