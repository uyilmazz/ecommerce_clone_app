import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../_product/widget/card/shopping_card.dart';
import '../../../_product/widget/text/header_text.dart';
import '../../../core/extension/context_extension.dart';
import '../../product/model/product.dart';
import '../../product/view_model/product_view_model.dart';
import '../../shopping_cart/view_model/shopping_card_view_model.dart';

class FavoriteView extends StatefulWidget {
  const FavoriteView({
    Key? key,
  }) : super(key: key);

  @override
  _FavoriteViewState createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> {
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      context.read<ProductViewModel>().setFavoriteProducts();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 3, child: buildPageHeader(context)),
        const Spacer(flex: 1),
        Expanded(
            flex: 18,
            child: context.watch<ProductViewModel>().favoriteProducts != null
                ? buildFavoriteCartListView
                : const Center(child: Text('Cart is Empty!'))),
        SizedBox(height: context.height * 0.03),
        const Divider(color: Color(0xFFEBECED), thickness: 2),
        const Spacer(),
        Expanded(flex: 2, child: buildTotalPriceAndNext)
      ],
    );
  }

  Row buildPageHeader(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const HeaderText(firstText: 'Your Favorite', seconText: 'Products'),
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

  Widget get buildFavoriteCartListView => ListView.builder(
      padding: context.verticalLowPadding,
      itemCount: context.watch<ProductViewModel>().favoriteProducts.length,
      itemBuilder: (context, index) {
        Product _currentProduct =
            context.watch<ProductViewModel>().favoriteProducts[index];
        return CustomShoppingOrFavoriteCard(
            product: _currentProduct, isFavorite: true);
      });

  Widget get buildTotalPriceAndNext => Padding(
      padding: EdgeInsets.only(bottom: context.heightNormalValue * 2),
      child: buildTotalText);

  Widget get buildTotalText => Center(
          child: RichText(
        text: TextSpan(
          text: 'You have ',
          style: context.textTheme.subtitle1!.copyWith(
              fontWeight: FontWeight.w800, color: const Color(0xFFC5C6C8)),
          children: <TextSpan>[
            TextSpan(
                text:
                    '${context.read<ProductViewModel>().favoriteProducts.length} favorite',
                style: context.textTheme.subtitle1!
                    .copyWith(fontWeight: FontWeight.w800, color: Colors.red)),
            TextSpan(
                text: ' Items',
                style: context.textTheme.subtitle1!.copyWith(
                    fontWeight: FontWeight.w800,
                    color: const Color(0xFFC5C6C8))),
          ],
        ),
      ));
}
