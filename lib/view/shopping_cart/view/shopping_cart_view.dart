import '../../product/view_model/product_view_model.dart';
import '../view_model/shopping_card_view_model.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../_product/widget/card/shopping_card.dart';
import 'package:flutter/material.dart';
import '../../../core/extension/context_extension.dart';
import '../../product/model/product.dart';

class ShoppingCart extends StatefulWidget {
  const ShoppingCart({
    Key? key,
  }) : super(key: key);

  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  final ShoppingCardViewModel _shoppingCardViewModel = ShoppingCardViewModel();
  final ProductViewModel _productViewModel = ProductViewModel();

  @override
  void initState() {
    _shoppingCardViewModel.calculateTotalPrice();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.dynamicWidth(0.05)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: context.heighLowValue),
          Expanded(flex: 3, child: buildPageHeader(context)),
          const Spacer(flex: 2),
          Expanded(
              flex: 15,
              child: _shoppingCardViewModel.shoppingCart.cart != null
                  ? buildShoppingCartListView()
                  : const Center(child: Text('Cart is Empty!'))),
          SizedBox(height: context.height * 0.03),
          const Divider(color: Color(0xFFEBECED), thickness: 2),
          const Spacer(),
          Expanded(flex: 6, child: buildTotalPriceAndNext)
        ],
      ),
    );
  }

  Row buildPageHeader(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [buildHeaderText(), buildHeaderIcon(context)],
    );
  }

  IconButton buildHeaderIcon(BuildContext context) {
    return IconButton(
        onPressed: () {},
        icon: Icon(Icons.delete_outline,
            size: context.heightMediumValue * 0.8,
            color: const Color(0xFFE65829)));
  }

  Column buildHeaderText() {
    return Column(
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
    );
  }

  // Widget buildShoppingCartListView() => Observer(
  //     builder: (context) => ListView(
  //         padding: context.verticalLowPadding,
  //         children: List.generate(
  //             _shoppingCardViewModel.shoppingCart.cart!.length, (index) {
  //           print('quantity : ' +
  //               _shoppingCardViewModel.shoppingCart.cart![index].quantity
  //                   .toString());
  //           Product _product = _productViewModel.products.firstWhere((product) {
  //             return product.id ==
  //                 _shoppingCardViewModel.shoppingCart.cart![index].productId;
  //           });
  //           int quantity =
  //               _shoppingCardViewModel.shoppingCart.cart![index].quantity!;
  //           return CustomShoppingCard(product: _product, quantity: quantity);
  //         })));

  Widget buildShoppingCartListView() => Observer(
      builder: (context) => ListView.builder(
          padding: context.verticalLowPadding,
          itemCount: _shoppingCardViewModel.shoppingCart.cart!.length,
          itemBuilder: (context, index) {
            print('quantity : ' +
                _shoppingCardViewModel.shoppingCart.cart![index].quantity
                    .toString());
            Product _product = _productViewModel.products.firstWhere((product) {
              return product.id ==
                  _shoppingCardViewModel.shoppingCart.cart![index].productId;
            });
            int quantity =
                _shoppingCardViewModel.shoppingCart.cart![index].quantity!;
            return CustomShoppingCard(product: _product, quantity: quantity);
          }));

  Widget get buildTotalPriceAndNext => Padding(
        padding: EdgeInsets.only(bottom: context.heightNormalValue * 2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [buildTotalText, buildNextButton()],
        ),
      );

  Widget get buildTotalText => Observer(builder: (context) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
                _shoppingCardViewModel.shoppingCart.cart != null
                    ? '${_shoppingCardViewModel.shoppingCart.cart!.length} Items'
                    : 'Cart is Empty',
                style: context.textTheme.subtitle1!.copyWith(
                    color: Color(0xFFC5C6C8), fontWeight: FontWeight.w600)),
            Text(_shoppingCardViewModel.totalPrice.toString(),
                style: context.textTheme.headline6!
                    .copyWith(fontWeight: FontWeight.w900)),
          ],
        );
      });

  ElevatedButton buildNextButton() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: const Color(0xFFE6582A),
          minimumSize: Size(context.witdh * 0.8, context.height * 0.065),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(context.heightNormalValue)),
          // padding: EdgeInsets.symmetric(horizontal: context.witdh * 0.3),
        ),
        onPressed: () {},
        child: Text(
          'Next',
          style: context.textTheme.headline6!
              .copyWith(color: Colors.white, fontWeight: FontWeight.w400),
        ));
  }
}
