import 'package:flutter/material.dart';

import '../../../view/product/model/product.dart';
import '../card/product_detail_image_card.dart';

class ProductImagesListView extends StatefulWidget {
  final Product product;
  const ProductImagesListView({Key? key, required this.product})
      : super(key: key);

  @override
  _ProductImagesListViewState createState() => _ProductImagesListViewState();
}

class _ProductImagesListViewState extends State<ProductImagesListView> {
  int _selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: List.generate(
          widget.product.detailImages!.length,
          (index) => GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedItem = index;
                  });
                },
                child: ImageCard(
                    imageName: widget.product.detailImages![index],
                    selected: index == _selectedItem ? true : false),
              )),
    );
  }
}
