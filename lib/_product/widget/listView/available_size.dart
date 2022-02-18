import 'package:flutter/material.dart';

import '../../../view/product/model/product.dart';
import '../card/detail_size_cart.dart';

class AvailableSizeListView extends StatefulWidget {
  final Product product;
  const AvailableSizeListView({Key? key, required this.product})
      : super(key: key);

  @override
  _AvailableSizeListViewState createState() => _AvailableSizeListViewState();
}

class _AvailableSizeListViewState extends State<AvailableSizeListView> {
  int _availableSizeItem = 0;

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: List.generate(
          widget.product.availableSize!.length,
          (index) => GestureDetector(
                onTap: () {
                  setState(() {
                    _availableSizeItem = index;
                  });
                },
                child: AvailableSizeCart(
                    selected: _availableSizeItem == index ? true : false,
                    sizeString: widget.product.availableSize![index]),
              )),
    );
  }
}
