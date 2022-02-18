import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../_product/widget/card/shopping_card.dart';
import '../../../_product/widget/text/header_text.dart';
import '../../../core/extension/context_extension.dart';
import '../../product/model/product.dart';
import '../../product/view_model/product_view_model.dart';
import '../view_model/shopping_card_view_model.dart';

class ShoppingCart extends StatefulWidget {
  const ShoppingCart({
    Key? key,
  }) : super(key: key);

  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  final ProductViewModel _productViewModel = ProductViewModel();

  @override
  void initState() {
    context.read<ShoppingCardViewModel>().calculateTotalPrice();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 3, child: buildPageHeader(context)),
        const Spacer(flex: 2),
        Expanded(
            flex: 15,
            child: context.watch<ShoppingCardViewModel>().cartItems != null
                ? buildShoppingCartListView()
                : const Center(child: Text('Cart is Empty!'))),
        SizedBox(height: context.height * 0.03),
        const Divider(color: Color(0xFFEBECED), thickness: 2),
        const Spacer(),
        Expanded(flex: 6, child: buildTotalPriceAndNext)
      ],
    );
  }

  Row buildPageHeader(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const HeaderText(firstText: 'Shopping', seconText: 'Cart'),
        buildHeaderIcon(context)
      ],
    );
  }

  IconButton buildHeaderIcon(BuildContext context) {
    return IconButton(
        onPressed: () {},
        icon: Icon(Icons.delete_outline,
            size: context.heightMediumValue * 0.8,
            color: const Color(0xFFE65829)));
  }

  Widget buildShoppingCartListView() => ListView.builder(
      padding: context.verticalLowPadding,
      itemCount: context.watch<ShoppingCardViewModel>().cartItems.length,
      itemBuilder: (context, index) {
        Product _product = _productViewModel.products.firstWhere((product) {
          return product.id ==
              context.read<ShoppingCardViewModel>().cartItems[index].productId;
        });
        int quantity =
            context.watch<ShoppingCardViewModel>().cartItems[index].quantity!;
        return CustomShoppingOrFavoriteCard(
            product: _product, quantity: quantity);
      });

  Widget get buildTotalPriceAndNext => Padding(
        padding: EdgeInsets.only(bottom: context.heightNormalValue * 2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [buildTotalText, buildNextButton],
        ),
      );

  Widget get buildTotalText => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
              context.read<ShoppingCardViewModel>().cartItems != null
                  ? '${context.read<ShoppingCardViewModel>().cartItems.length} Items'
                  : 'Cart is Empty',
              style: context.textTheme.subtitle1!.copyWith(
                  color: const Color(0xFFC5C6C8), fontWeight: FontWeight.w600)),
          Text(context.read<ShoppingCardViewModel>().totalPrice.toString(),
              style: context.textTheme.headline6!
                  .copyWith(fontWeight: FontWeight.w900)),
        ],
      );

  ElevatedButton get buildNextButton => ElevatedButton(
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
