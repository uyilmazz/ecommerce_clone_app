import 'package:ecommerce_clone_app/core/extension/context_extension.dart';
import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  final double indent;
  final double endIndent;

  const CustomDivider({Key? key, this.indent = 0.40, this.endIndent = 0.40})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Colors.grey,
      // height: 10,
      indent: context.witdh * indent,
      endIndent: context.witdh * endIndent,
      thickness: 4,
    );
  }
}
