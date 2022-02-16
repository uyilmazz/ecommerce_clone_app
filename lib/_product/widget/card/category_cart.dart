// import 'package:ecommerce_clone_app/core/extension/context_extension.dart';
// import 'package:flutter/material.dart';

// class CategoryCard extends StatelessWidget {
//   final int index;
//   final 

//   const CategoryCard({Key? key, required this.index}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: context.dynamicHeight(0.15),
//       alignment: Alignment.center,
//       margin: EdgeInsets.symmetric(horizontal: context.dynamicWidth(0.03)),
//       padding: EdgeInsets.symmetric(
//           horizontal: context.dynamicWidth(0.03),
//           vertical: context.dynamicHeight(0.01)),
//       decoration: BoxDecoration(
//           border: Border.all(
//               color: index == 1 ? Colors.orange : Colors.grey,
//               width: index == 1 ? 2 : 1),
//           borderRadius:
//               BorderRadius.all(Radius.circular(context.dynamicWidth(0.03)))),
//       child: Row(
//         children: [Icon(Icons.menu), Text(tabs[index])],
//       ),
//     );
//   }
// }
