import 'package:flutter/material.dart';

import '../../../core/extension/context_extension.dart';

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
        radius: context.heightNormalValue,
        child: selected
            ? Icon(
                Icons.check_circle,
                color: color,
                size: context.heightNormalValue * 1.5,
              )
            : CircleAvatar(
                radius: 10,
                backgroundColor: color,
              ),
      ),
    );
  }
}
