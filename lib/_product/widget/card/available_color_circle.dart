import 'package:ecommerce_clone_app/core/extension/context_extension.dart';
import 'package:ecommerce_clone_app/core/extension/string_extension.dart';
import 'package:flutter/material.dart';

class AvailableColorCart extends StatelessWidget {
  final bool selected;
  final Color color;

  const AvailableColorCart(
      {Key? key, required this.selected, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: context.dynamicWidth(0.035)),
      child: CircleAvatar(
        backgroundColor: color.withAlpha(100),
        radius: context.normalValue,
        child: selected
            ? Icon(
                Icons.check_circle,
                color: color,
                size: context.normalValue * 1.5,
              )
            : CircleAvatar(
                radius: 10,
                backgroundColor: color,
              ),
      ),
    );
  }
}
