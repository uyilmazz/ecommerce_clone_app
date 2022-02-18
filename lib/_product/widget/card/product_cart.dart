import '../text/custom_rich_text.dart';
import '../../../view/product/view_model/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/extension/context_extension.dart';
import '../../../core/extension/string_extension.dart';
import '../../../view/product/model/product.dart';
import '../../../view/product/view/product_detail.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback iconButtonOnPress;

  const ProductCard(
      {Key? key, required this.product, required this.iconButtonOnPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: context.heightNormalValue,
          vertical: context.heightNormalValue),
      margin: context.heightLowPadding,
      width: context.dynamicWidth(0.5),
      height: context.dynamicHeight(0.32),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(context.heightNormalValue)),
      child: Stack(
        children: [buildColumnBodyInfo(context), buildFavoriteButton()],
      ),
    );
  }

  Positioned buildFavoriteButton() {
    return Positioned(
        left: 0,
        top: -10,
        child: IconButton(
            splashRadius: 0.1,
            onPressed: iconButtonOnPress,
            icon: Icon(
              product.isFavorite! ? Icons.favorite : Icons.favorite_border,
              color: product.isFavorite! ? Colors.red : Colors.grey,
            )));
  }

  Widget buildColumnBodyInfo(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<ProductViewModel>().setCurrentProduct(product);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductDetail(
                    product:
                        context.watch<ProductViewModel>().currentProduct)));
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                radius: context.dynamicHeight(0.045),
                backgroundColor: const Color(0xFFFBE5DD),
              ),
              Image.asset(product.imageUrl.toString().toPng)
            ],
          ),
          Text(product.name.toString(),
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(fontWeight: FontWeight.w700)),
          Text(
            product.category.toString(),
            style: Theme.of(context).textTheme.subtitle2!.copyWith(
                fontWeight: FontWeight.bold, color: const Color(0xFFEA744E)),
          ),
          CustomRichText(
              firstText: '\$ ', seconText: product.price, fontSize: 18),
        ],
      ),
    );
  }
}
