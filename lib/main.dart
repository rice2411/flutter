import 'package:flutter/material.dart';
import 'package:flutter_rice_app/product/pages/home/index.dart';
import 'package:flutter_rice_app/product/provider/Cart.dart';
import 'package:flutter_rice_app/product/provider/Category.dart';
import 'package:flutter_rice_app/product/provider/Product.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ProductProivder()),
      ChangeNotifierProvider(create: (_) => CategoryProvider()),
      ChangeNotifierProvider(create: (_) => CartProvider())
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ),
  ));
}
