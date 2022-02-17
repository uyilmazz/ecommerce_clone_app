import 'package:flutter/material.dart';

import '../../core/extension/context_extension.dart';

class CustomDivider extends StatelessWidget {
  final double indent;
  final double endIndent;

  const CustomDivider({Key? key, this.indent = 0.40, this.endIndent = 0.40})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: context.verticalNormalPadding,
      alignment: Alignment.centerRight,
      decoration: BoxDecoration(
          color: Colors.grey, borderRadius: BorderRadius.circular(10)),
      height: 5,
      width: 50,
    );
  }
}
