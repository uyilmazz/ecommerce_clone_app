import 'package:ecommerce_clone_app/_product/widget/card/product_detail_image_card.dart';
import 'package:ecommerce_clone_app/_product/widget/custom_divider.dart';
import 'package:ecommerce_clone_app/core/extension/context_extension.dart';
import 'package:ecommerce_clone_app/core/extension/string_extension.dart';
import 'package:ecommerce_clone_app/view/product/model/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductDetail extends StatefulWidget {
  final Product product;

  const ProductDetail({Key? key, required this.product}) : super(key: key);

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  int selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            flex: 4,
            child: Container(
              padding: context.verticalAndHorizontalLowPadding,
              child: Column(children: [
                buildAppBar(context),
                Expanded(flex: 3, child: buildProductImage(context)),
              ]),
            ),
          ),
          Expanded(flex: 6, child: buildProductDetail(context))
        ],
      )),
    );
  }

  Container buildProductDetail(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: context.mediumValue),
      padding: EdgeInsets.symmetric(
          vertical: context.lowValue, horizontal: context.normalValue),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
              BorderRadius.vertical(top: Radius.circular(context.mediumValue))),
      child: Column(
        children: [
          const CustomDivider(indent: 0.40, endIndent: 0.40),
          buildNameAndPrice(context),
          buildRatingBar(context)
        ],
      ),
    );
  }

  Align buildRatingBar(BuildContext context) {
    return Align(
        alignment: Alignment.bottomRight,
        child: RatingBar.builder(
          initialRating: 3,
          itemSize: context.normalValue,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemBuilder: (context, _) => const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {
            print(rating);
          },
        ));
  }

  Row buildNameAndPrice(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.product.name.toString().toUpperCase(),
          style: Theme.of(context)
              .textTheme
              .headline5!
              .copyWith(fontWeight: FontWeight.w800),
        ),
        RichText(
          text: TextSpan(
            text: '\$ ',
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(fontWeight: FontWeight.w800, color: Colors.red),
            children: <TextSpan>[
              TextSpan(
                  text: widget.product.price.toString(),
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                      fontWeight: FontWeight.w800, color: Colors.black)),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildProductImage(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: context.lowValue),
      child: Column(children: [
        Expanded(
          flex: 15,
          child: buildStackProductImage(context),
        ),
        Expanded(
          flex: 4,
          child: widget.product.detailImages != null
              ? buildImageDetailListView(context)
              : const SizedBox(),
        )
      ]),
    );
  }

  ListView buildImageDetailListView(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: List.generate(
          widget.product.detailImages!.length,
          (index) => GestureDetector(
                onTap: () {
                  setState(() {
                    selectedItem = index;
                  });
                },
                child: ImageCard(
                    imageName: widget.product.detailImages![index],
                    selected: index == selectedItem ? true : false),
              )),
    );
  }

  Stack buildStackProductImage(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Text('AIP',
            style: TextStyle(
                fontSize: context.highValue * 2,
                color: Colors.grey.shade300,
                fontWeight: FontWeight.bold)),
        Image.asset(
          'show_1'.toPng, // widget.product.detailImages![selectedItem].toPng
        )
      ],
    );
  }

  Row buildAppBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          child: Container(
            padding: context.normalPadding * 0.6,
            decoration: BoxDecoration(
              border: Border.all(width: 1.5, color: Colors.grey),
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(context.lowValue * 1.5),
            ),
            child: Icon(Icons.arrow_back_ios_outlined,
                size: context.normalValue, color: Colors.grey),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        InkWell(
          child: Container(
            padding: context.normalPadding * 0.7,
            decoration: BoxDecoration(
                boxShadow: const <BoxShadow>[
                  BoxShadow(
                      color: Color(0xfff8f8f8),
                      blurRadius: 5,
                      spreadRadius: 10,
                      offset: Offset(5, 5)),
                ],
                border: Border.all(
                    style: BorderStyle.none, width: 1.5, color: Colors.grey),
                color: Colors.white,
                borderRadius: BorderRadius.circular(context.lowValue)),
            child: Icon(
                widget.product.isFavorite!
                    ? Icons.favorite
                    : Icons.favorite_border,
                size: context.normalValue,
                color: widget.product.isFavorite! ? Colors.red : Colors.grey),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
