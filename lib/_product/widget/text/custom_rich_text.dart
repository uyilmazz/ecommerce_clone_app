import 'package:ecommerce_clone_app/core/extension/context_extension.dart';
import 'package:flutter/material.dart';

class CustomRichText extends StatelessWidget {
  final double? price;
  const CustomRichText({Key? key, this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: '\$ ',
        style: context.textTheme.headline6!
            .copyWith(fontWeight: FontWeight.w800, color: Colors.red),
        children: <TextSpan>[
          TextSpan(
              text: price.toString(),
              style: context.textTheme.headline5!
                  .copyWith(fontWeight: FontWeight.w800, color: Colors.black)),
        ],
      ),
    );
  }
}
