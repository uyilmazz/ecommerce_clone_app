import 'package:ecommerce_clone_app/_product/widget/card/shopping_card.dart';
import 'package:ecommerce_clone_app/_product/widget/text/custom_rich_text.dart';
import 'package:ecommerce_clone_app/core/extension/string_extension.dart';
import 'package:flutter/material.dart';

import 'package:ecommerce_clone_app/core/extension/context_extension.dart';

import '../../product/model/product.dart';
import '../model/shopping_cart_model.dart';

class ShoppingCart extends StatefulWidget {
  List<Product> products;

  ShoppingCart({
    Key? key,
    required this.products,
  }) : super(key: key);

  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  ShoppingCartModel shoppingCart = ShoppingCartModel(cart: [
    {'id': 1, 'quantity': 2},
    {'id': 2, 'quantity': 1},
    {'id': 3, 'quantity': 5},
    {'id': 4, 'quantity': 4},
    {'id': 5, 'quantity': 2},
  ]);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.dynamicWidth(0.05)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: context.lowValue),
          Expanded(flex: 2, child: buildPageHeader(context)),
          const Spacer(),
          Expanded(
              flex: 12,
              child: shoppingCart.cart != null
                  ? buildShoppingCartListView()
                  : const Center(child: Text('Cart is Empty!'))),
          Expanded(
              flex: 6,
              child: Container(
                color: Colors.blue,
              ))
        ],
      ),
    );
  }

  ListView buildShoppingCartListView() {
    return ListView(
        padding: context.verticalLowPadding,
        children: List.generate(shoppingCart.cart!.length, (index) {
          Product _product = widget.products.firstWhere((product) {
            return product.id == shoppingCart.cart![index]['id'];
          });
          int quantity = shoppingCart.cart![index]['quantity']!;
          return CustomShoppingCard(product: _product, quantity: quantity);
        }));
  }

  Row buildPageHeader(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Shopping',
                style: TextStyle(fontSize: 28, color: Color(0xFF49505C))),
            Text('Cart',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF424A56)))
          ],
        ),
        IconButton(
            onPressed: () {},
            icon: Icon(Icons.delete_outline,
                size: context.mediumValue * 0.8,
                color: const Color(0xFFE65829)))
      ],
    );
  }
}
