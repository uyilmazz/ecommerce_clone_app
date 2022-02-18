import 'package:flutter/material.dart';

import '../../../core/extension/context_extension.dart';

class CustomRichText extends StatelessWidget {
  final String? firstText;
  final double? seconText;
  final double? fontSize;
  const CustomRichText(
      {Key? key, this.firstText, this.seconText, this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: firstText,
        style: context.textTheme.headline6!.copyWith(
            fontWeight: FontWeight.w800,
            color: Colors.red,
            fontSize: fontSize != null ? fontSize! * 0.9 : 28.0),
        children: <TextSpan>[
          TextSpan(
              text: seconText.toString(),
              style: context.textTheme.headline5!.copyWith(
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                  fontSize: fontSize ?? 32.0)),
        ],
      ),
    );
  }
}
