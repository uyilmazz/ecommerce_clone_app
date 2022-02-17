import '../../shopping_cart/view_model/shopping_card_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../_product/widget/card/available_color_circle.dart';
import '../../../_product/widget/card/detail_size_cart.dart';
import '../../../_product/widget/card/product_detail_image_card.dart';
import '../../../_product/widget/custom_divider.dart';
import '../../../_product/widget/text/custom_rich_text.dart';
import '../../../core/extension/context_extension.dart';
import '../../../core/extension/string_extension.dart';
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

  final ShoppingCardViewModel _shoppingCardViewModel = ShoppingCardViewModel();

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
          _shoppingCardViewModel.addProduct(widget.product.id!);
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
        _appBarIcon(
            Icons.arrow_back_ios_outlined, () => {Navigator.pop(context)},
            isOutline: true, color: Colors.black54),
        _appBarIcon(
            widget.product.isFavorite! ? Icons.favorite : Icons.favorite_border,
            () => {Navigator.pop(context)},
            isOutline: false,
            color: widget.product.isFavorite! ? Colors.red : Colors.grey),
      ],
    );
  }

  Widget _appBarIcon(IconData icon, Function() onPressed,
      {Color color = Colors.grey, bool isOutline = false}) {
    return InkWell(
      child: Container(
        padding: context.heightNormalPadding * 0.7,
        decoration: BoxDecoration(
          border: Border.all(
              style: isOutline ? BorderStyle.solid : BorderStyle.none,
              width: 1.5,
              color: !isOutline ? Colors.transparent : Colors.grey),
          color: isOutline ? Colors.transparent : Colors.white,
          borderRadius: BorderRadius.circular(context.heighLowValue * 1.5),
        ),
        child: Icon(icon, size: context.heightNormalValue, color: color),
      ),
      onTap: onPressed,
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
              ? buildImageDetailListView(context)
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
            Container(
              height: context.height * 0.14,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Available Size',
                      style: context.textTheme.subtitle1!
                          .copyWith(fontWeight: FontWeight.w700)),
                  buildAvailableSizeCart(context),
                ],
              ),
            ),

            Container(
              height: context.height * 0.14,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Available Color',
                      style: context.textTheme.subtitle1!
                          .copyWith(fontWeight: FontWeight.w700)),
                  buildAvailableColor(context),
                ],
              ),
            ),
            Column(
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
                    style: context.textTheme.subtitle1!.copyWith(
                        fontWeight: FontWeight.w400, color: Colors.black54))
              ],
            )
            // buildAvailableColor(context),
          ],
        ),
      ),
    );
  }

  Widget buildAvailableColor(BuildContext context) {
    return availableColor != null
        ? Container(
            padding: EdgeInsets.only(left: context.heighLowValue),
            height: context.height * 0.06,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                  availableColor!.length,
                  (index) => GestureDetector(
                        onTap: () {
                          setState(() {
                            availableColorSeletecItem = index;
                          });
                        },
                        child: AvailableColorCart(
                            selected: availableColorSeletecItem == index
                                ? true
                                : false,
                            color: availableColor![index]),
                      )),
            ),
          )
        : const Text('Not Available Color');
  }

  Widget buildAvailableSizeCart(BuildContext context) {
    return widget.product.availableSize != null
        ? Container(
            padding: EdgeInsets.only(left: context.heighLowValue),
            height: context.height * 0.06,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                  widget.product.availableSize!.length,
                  (index) => GestureDetector(
                        onTap: () {
                          setState(() {
                            availableSizeSelectedItem = index;
                          });
                        },
                        child: AvailableSizeCart(
                            selected: availableSizeSelectedItem == index
                                ? true
                                : false,
                            sizeString: widget.product.availableSize![index]),
                      )),
            ),
          )
        : const Text('Not Available Size');
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
          onRatingUpdate: (rating) {
            print(rating);
          },
        ));
  }

  Widget buildNameAndPrice(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.product.name.toString().toUpperCase(),
            style: context.textTheme.headline5!
                .copyWith(fontWeight: FontWeight.w800),
          ),
          CustomRichText(price: widget.product.price),
        ],
      ),
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
}
