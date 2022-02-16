import 'package:ecommerce_clone_app/view/product/view/product_detail.dart';
import 'package:ecommerce_clone_app/view/product/view/product_view.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
          backgroundColor: const Color(0xFFF9F9F9),
          appBarTheme: const AppBarTheme(
              backgroundColor: Color(0xFFF9F9F9), elevation: 0)),
      title: 'Material App',
      home: const ProductView(),
    );
  }
}
