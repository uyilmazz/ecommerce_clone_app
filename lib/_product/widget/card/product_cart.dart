import 'package:ecommerce_clone_app/view/product/view/product_detail.dart';

import '../../../core/extension/context_extension.dart';
import '../../../core/extension/string_extension.dart';
import 'package:flutter/material.dart';
import '../../../view/product/model/product.dart';

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
          horizontal: context.normalValue, vertical: context.normalValue),
      margin: context.lowPadding,
      width: context.dynamicWidth(0.5),
      height: context.dynamicHeight(0.32),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(context.normalValue)),
      child: Stack(
        children: [buildFavoriteButton(), buildColumnBodyInfo(context)],
      ),
    );
  }

  Positioned buildFavoriteButton() {
    return Positioned(
        left: 0,
        top: -10,
        child: IconButton(
            onPressed: iconButtonOnPress,
            icon: const Icon(
              Icons.favorite_border,
              color: Colors.grey,
            )));
  }

  Widget buildColumnBodyInfo(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductDetail(product: product)));
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
                fontWeight: FontWeight.bold, color: Color(0xFFEA744E)),
          ),
          Text(product.price.toString(),
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(fontWeight: FontWeight.bold, fontSize: 18))
        ],
      ),
    );
  }
}
