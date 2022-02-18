import 'package:flutter/material.dart';

import '../../../core/extension/context_extension.dart';
import '../../../core/extension/string_extension.dart';
import '../../../view/product/model/product.dart';

class CustomShoppingOrFavoriteCard extends StatelessWidget {
  final Product product;
  final int? quantity;
  final bool? isFavorite;

  const CustomShoppingOrFavoriteCard(
      {Key? key, required this.product, this.quantity, this.isFavorite})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: context.height * 0.095,
        margin: EdgeInsets.only(bottom: context.heighLowValue),
        child: Row(
          children: [
            buildImageStack(context),
            Expanded(child: buildCardListTile(context))
          ],
        ));
  }

  ListTile buildCardListTile(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        product.name.toString(),
        style: context.textTheme.headline6!
            .copyWith(fontSize: 17, color: const Color(0xFF49515C)),
      ),
      subtitle: RichText(
        text: TextSpan(
          text: '\$ ',
          style: context.textTheme.subtitle2!
              .copyWith(fontWeight: FontWeight.w700, color: Colors.red),
          children: <TextSpan>[
            TextSpan(
                text: product.price.toString(),
                style: context.textTheme.subtitle2!.copyWith(
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF29323F))),
          ],
        ),
      ),
      trailing: buildQuantityContainer(context),
    );
  }

  Container buildQuantityContainer(BuildContext context) {
    return Container(
      width: context.height * 0.05,
      height: context.height * 0.05,
      decoration: BoxDecoration(
          color: const Color(0xFFEBECED),
          borderRadius: BorderRadius.circular(context.heighLowValue)),
      child: Center(
          child: !(isFavorite != null && isFavorite == true)
              ? Text('x$quantity',
                  style: context.textTheme.subtitle1!.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: const Color(0xFF373F4C)))
              : IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite, color: Colors.red))),
    );
  }

  Stack buildImageStack(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: context.height * 0.095,
          width: context.witdh * 0.21,
          decoration: BoxDecoration(
              color: const Color(0xFFE1E2E4),
              borderRadius: BorderRadius.circular(context.heighLowValue * 1.5)),
        ),
        RotationTransition(
            alignment: Alignment.bottomLeft,
            turns: const AlwaysStoppedAnimation(-10 / 360),
            child: Image.asset(
              product.imageUrl.toString().toPng,
              fit: BoxFit.cover,
              width: context.witdh * 0.32,
              height: context.height * 0.2,
            ))
      ],
    );
  }
}
