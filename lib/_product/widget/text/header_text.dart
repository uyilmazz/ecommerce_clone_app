import 'package:flutter/material.dart';

class HeaderText extends StatelessWidget {
  final String? firstText;
  final String? seconText;
  const HeaderText({Key? key, this.firstText, this.seconText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(firstText ?? '', style: const TextStyle(fontSize: 25)),
        Text(seconText ?? '',
            style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color(0xFF424A56))),
      ],
    );
  }
}
