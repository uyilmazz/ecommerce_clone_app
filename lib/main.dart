import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'view/product/view/product_view.dart';
import 'view/product/view_model/product_view_model.dart';
import 'view/shopping_cart/view_model/shopping_card_view_model.dart';

void main() => runApp(MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => ShoppingCardViewModel()),
      ChangeNotifierProvider(create: (context) => ProductViewModel()),
    ], child: const MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
