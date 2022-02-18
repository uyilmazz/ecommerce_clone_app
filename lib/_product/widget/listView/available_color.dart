import 'package:flutter/material.dart';

import '../card/available_color_circle.dart';

class AvailableColorListView extends StatefulWidget {
  final List<Color> availableColor;

  const AvailableColorListView({Key? key, required this.availableColor})
      : super(key: key);

  @override
  _AvailableColorListViewState createState() => _AvailableColorListViewState();
}

class _AvailableColorListViewState extends State<AvailableColorListView> {
  int availableColorSeletecItem = 0;

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: List.generate(
          widget.availableColor.length,
          (index) => GestureDetector(
                onTap: () {
                  setState(() {
                    availableColorSeletecItem = index;
                  });
                },
                child: AvailableColorCart(
                    selected: availableColorSeletecItem == index ? true : false,
                    color: widget.availableColor[index]),
              )),
    );
  }
}
