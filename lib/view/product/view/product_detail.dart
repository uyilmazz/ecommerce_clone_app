import '../../../_product/widget/buttom/app_icon_button.dart';
import '../view_model/product_view_model.dart';

import '../../../_product/widget/listView/available_color.dart';
import '../../../_product/widget/listView/available_size.dart';
import '../../../_product/widget/listView/product_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

import '../../../_product/widget/divider/custom_divider.dart';
import '../../../_product/widget/text/custom_rich_text.dart';
import '../../../core/extension/context_extension.dart';
import '../../../core/extension/string_extension.dart';
import '../../shopping_cart/view_model/shopping_card_view_model.dart';
import '../model/product.dart';

class ProductDetail extends StatefulWidget {
  final Product product;

  const ProductDetail({Key? key, required this.product}) : super(key: key);

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  int selectedItem = 0;
  int availableSizeSelectedItem = 0;
  int availableColorSeletecItem = 0;
  String red2 = "red";
  List<Color>? availableColor = [
    Colors.red,
    Colors.blue,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.black,
    Colors.purple
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: buildFloatingActionButton(),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(flex: 4, child: buildAppBarAndImageCategory(context)),
          Expanded(flex: 6, child: buildProductDetail(context))
        ],
      )),
    );
  }

  FloatingActionButton buildFloatingActionButton() {
    return FloatingActionButton(
        backgroundColor: const Color(0xFFE65829),
        onPressed: () {
          context.read<ShoppingCardViewModel>().addProduct(widget.product.id!);
          Navigator.pop(context);
        },
        child: const Icon(
          Icons.shopping_basket,
          color: Colors.white,
        ));
  }

  Container buildAppBarAndImageCategory(BuildContext context) {
    return Container(
      padding: context.verticalAndHorizontalLowPadding,
      child: Column(children: [
        buildAppBar(context),
        Expanded(flex: 3, child: buildProductImage(context)),
      ]),
    );
  }

  Row buildAppBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomAppBarIconButton(
            icon: Icons.arrow_back_ios_outlined,
            onPressed: () => Navigator.pop(context),
            isOutline: true,
            color: Colors.black54),
        CustomAppBarIconButton(
            icon: context.watch<ProductViewModel>().currentProduct.isFavorite!
                ? Icons.favorite
                : Icons.favorite_border,
            onPressed: () => context
                .read<ProductViewModel>()
                .changeFavoriteProduct(widget.product.id!),
            color: context.watch<ProductViewModel>().currentProduct.isFavorite!
                ? Colors.red
                : Colors.grey)
      ],
    );
  }

  Widget buildProductImage(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: context.heighLowValue),
      child: Column(children: [
        Expanded(
          flex: 16,
          child: buildStackProductImage(context),
        ),
        Expanded(
          flex: 4,
          child: widget.product.detailImages != null
              ? ProductImagesListView(product: widget.product)
              : const SizedBox(),
        )
      ]),
    );
  }

  Stack buildStackProductImage(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Text('AIP',
            style: TextStyle(
                fontSize: context.heightHighValue * 2,
                color: Colors.grey.shade300,
                fontWeight: FontWeight.bold)),
        Image.asset(
          'show_1'.toPng, // widget.product.detailImages![selectedItem].toPng
        )
      ],
    );
  }

  Widget buildProductDetail(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(top: context.heightMediumValue),
        padding: EdgeInsets.symmetric(
            vertical: context.heighLowValue,
            horizontal: context.heightNormalValue),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
                top: Radius.circular(context.heightMediumValue * 1.5))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Center(child: CustomDivider(indent: 0.40, endIndent: 0.40)),
            buildNameAndPrice(context),
            buildRatingBar(context),
            buildAvailableSize(context),
            buildAvailableColor(context),
            buildProductDescription(context)
            // buildAvailableColor(context),
          ],
        ),
      ),
    );
  }

  Widget buildNameAndPrice(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.product.name.toString().toUpperCase(),
            style: context.textTheme.headline5!
                .copyWith(fontWeight: FontWeight.w800),
          ),
          CustomRichText(firstText: '\$ ', seconText: widget.product.price),
        ],
      ),
    );
  }

  Align buildRatingBar(BuildContext context) {
    return Align(
        alignment: Alignment.bottomRight,
        child: RatingBar.builder(
          initialRating: widget.product.rates!,
          itemSize: context.heightNormalValue,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemBuilder: (context, _) => const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {},
        ));
  }

  SizedBox buildAvailableSize(BuildContext context) {
    return SizedBox(
      height: context.height * 0.14,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text('Available Size',
              style: context.textTheme.subtitle1!
                  .copyWith(fontWeight: FontWeight.w700)),
          buildAvailableSizeCart(context),
        ],
      ),
    );
  }

  Widget buildAvailableSizeCart(BuildContext context) {
    return widget.product.availableSize != null
        ? Container(
            padding: EdgeInsets.only(left: context.heighLowValue),
            height: context.height * 0.06,
            child: AvailableSizeListView(product: widget.product),
          )
        : const Text('Not Available Size');
  }

  SizedBox buildAvailableColor(BuildContext context) {
    return SizedBox(
      height: context.height * 0.14,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('Available Color',
              style: context.textTheme.subtitle1!
                  .copyWith(fontWeight: FontWeight.w700)),
          buildAvailableColorListView(context),
        ],
      ),
    );
  }

  Widget buildAvailableColorListView(BuildContext context) {
    return availableColor != null
        ? Container(
            padding: EdgeInsets.only(left: context.heighLowValue),
            height: context.height * 0.06,
            child: AvailableColorListView(availableColor: availableColor!))
        : const Text('Not Available Color');
  }

  Column buildProductDescription(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Product Description',
            style: context.textTheme.subtitle1!
                .copyWith(fontWeight: FontWeight.w700)),
        SizedBox(
          height: context.heightNormalValue,
        ),
        Text(
            widget.product.description != null
                ? widget.product.description.toString()
                : 'Product description is not found',
            style: context.textTheme.subtitle1!
                .copyWith(fontWeight: FontWeight.w400, color: Colors.black54))
      ],
    );
  }
}
