import 'package:ecommerce_clone_app/core/extension/context_extension.dart';
import 'package:ecommerce_clone_app/core/extension/string_extension.dart';
import 'package:flutter/material.dart';

class AvailableSizeCart extends StatelessWidget {
  final bool selected;
  final String sizeString;

  const AvailableSizeCart(
      {Key? key, required this.selected, required this.sizeString})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: context.dynamicWidth(0.03)),
      padding: EdgeInsets.symmetric(
        horizontal: context.dynamicWidth(0.025),
      ),
      decoration: BoxDecoration(
          color: selected ? const Color(0xFFE6582A) : Colors.transparent,
          border: Border.all(
              color: selected ? const Color(0xFFE6582A) : Colors.grey,
              width: 2),
          borderRadius:
              BorderRadius.all(Radius.circular(context.dynamicWidth(0.03)))),
      child: Text(sizeString,
          style: Theme.of(context).textTheme.headline6!.copyWith(
              color: selected ? Colors.white : const Color(0xFF272F3D),
              fontWeight: FontWeight.w800)),
    );
  }
}
