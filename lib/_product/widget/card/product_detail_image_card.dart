import 'package:ecommerce_clone_app/core/extension/context_extension.dart';
import 'package:ecommerce_clone_app/core/extension/string_extension.dart';
import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  final bool selected;
  final String imageName;

  const ImageCard({Key? key, required this.selected, required this.imageName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: context.dynamicWidth(0.02)),
      padding: EdgeInsets.symmetric(
        horizontal: context.dynamicWidth(0.015),
      ),
      decoration: BoxDecoration(
          border: Border.all(
              color: selected ? const Color(0xFFE75F31) : Colors.grey,
              width: selected ? 2 : 1),
          borderRadius:
              BorderRadius.all(Radius.circular(context.dynamicWidth(0.04)))),
      child: Image.asset(imageName.toPng),
    );
  }
}
