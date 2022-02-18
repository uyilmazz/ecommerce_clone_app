import 'package:flutter/material.dart';

import '../../../core/extension/context_extension.dart';

class CustomAppBarIconButton extends StatelessWidget {
  IconData icon;
  VoidCallback? onPressed;
  Color color;
  bool isOutline;
  double? iconSize;
  CustomAppBarIconButton(
      {Key? key,
      required this.icon,
      this.onPressed,
      this.color = Colors.grey,
      this.isOutline = false,
      this.iconSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
        child: Icon(icon,
            size: iconSize ?? context.heightNormalValue, color: color),
      ),
      onTap: onPressed ?? () {},
    );
  }
}
