import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import '../../../_product/widget/buttom/app_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../_product/widget/card/product_cart.dart';
import '../../../_product/widget/text/header_text.dart';
import '../../../core/extension/context_extension.dart';
import '../../../core/extension/string_extension.dart';
import '../../shopping_cart/view/shopping_cart_view.dart';
import '../model/category.dart';
import '../model/product.dart';
import '../view_model/product_view_model.dart';
import 'favorite_view.dart';

class ProductView extends StatefulWidget {
  const ProductView({Key? key}) : super(key: key);

  @override
  _ProductViewState createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  List<Category> categories = [
    Category(name: 'Sneakers', image: 'shoe_thumb_2'),
    Category(name: 'Jacket', image: 'jacket'),
    Category(name: 'Watch', image: 'watch'),
    Category(name: 'Bag', image: 'jacket'),
  ];

  int bottomNavigatorSelectedItem = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: buildBottomNavigationBar,
        body: SafeArea(
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: context.dynamicWidth(0.05)),
            child: Column(
              children: [
                const Spacer(flex: 2),
                Expanded(flex: 6, child: buildAppBar),
                const Spacer(flex: 3),
                Expanded(flex: 92, child: setPage())
              ],
            ),
          ),
        ));
  }

  Widget get buildAppBar => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomAppBarIconButton(
              icon: Icons.sort,
              color: Colors.black,
              isOutline: false,
              iconSize: context.heightNormalValue * 1.3),
          CircleAvatar(
            radius: context.heightNormalValue * 1.5,
            backgroundImage: const AssetImage('assets/images/profile.jpg'),
          )
        ],
      );

  Widget setPage() {
    return bottomNavigatorSelectedItem == 0
        ? buildOurProductsPage
        : bottomNavigatorSelectedItem == 1
            ? const SizedBox()
            : bottomNavigatorSelectedItem == 2
                ? const ShoppingCart()
                : const FavoriteView();
  }

  StyleProvider get buildBottomNavigationBar => StyleProvider(
        style: Style(),
        child: ConvexAppBar(
          height: context.height * 0.07,
          initialActiveIndex: bottomNavigatorSelectedItem,
          activeColor: const Color(0xFFFC6E20),
          color: Colors.grey,
          top: -context.heightNormalValue,
          backgroundColor: Colors.white,
          style: TabStyle.reactCircle,
          items: const [
            TabItem(icon: Icons.home),
            TabItem(icon: Icons.search),
            TabItem(icon: Icons.card_travel),
            TabItem(icon: Icons.favorite_border),
          ],
          onTap: (selected) {
            setState(() {
              bottomNavigatorSelectedItem = selected;
            });
          },
        ),
      );

  Widget get buildOurProductsPage => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeaderText(
            firstText: 'Our',
            seconText: 'Products',
          ),
          const Spacer(),
          Expanded(
              flex: 2,
              child: Row(children: [
                Expanded(child: buildSearchTextField),
                SizedBox(width: context.witdh * 0.04),
                CustomAppBarIconButton(
                    icon: Icons.filter_list,
                    color: Colors.black87,
                    iconSize: context.heightNormalValue * 1.3)
              ])),
          const Spacer(flex: 2),
          Expanded(flex: 2, child: buildTabMenu),
          Expanded(flex: 18, child: buildProductListView),
          const Spacer(flex: 3)
        ],
      );

  TextField get buildSearchTextField => TextField(
        decoration: InputDecoration(
            fillColor: const Color(0xFFF0F1F1),
            filled: true,
            labelText: 'Search Products',
            labelStyle: const TextStyle(
                fontSize: 13, color: Colors.grey, fontWeight: FontWeight.w500),
            prefixIcon: const Icon(Icons.search),
            contentPadding: EdgeInsets.zero,
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius:
                    BorderRadius.circular(context.dynamicWidth(0.03)))),
      );

  Widget get buildTabMenu => ListView(
      scrollDirection: Axis.horizontal,
      children: List.generate(
          categories.length, (index) => buildCategoryCard(index)));

  Widget get buildProductListView => ListView.builder(
      shrinkWrap: false,
      scrollDirection: Axis.horizontal,
      itemCount: context.watch<ProductViewModel>().products.length,
      itemBuilder: (context, index) {
        Product _currentProduct =
            context.read<ProductViewModel>().products[index];
        return Center(
          child: ProductCard(
              product: _currentProduct,
              iconButtonOnPress: () {
                context
                    .read<ProductViewModel>()
                    .changeFavoriteProduct(_currentProduct.id!);
              }),
        );
      });

  Container buildCategoryCard(int index) {
    return Container(
      height: context.dynamicHeight(0.15),
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: context.dynamicWidth(0.02)),
      padding: EdgeInsets.symmetric(
          horizontal: context.dynamicWidth(0.03),
          vertical: context.dynamicHeight(0.01)),
      decoration: BoxDecoration(
          border: Border.all(
              color: index == 1 ? const Color(0xFFE75F31) : Colors.grey,
              width: index == 1 ? 2 : 1),
          borderRadius:
              BorderRadius.all(Radius.circular(context.dynamicWidth(0.03)))),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          categories[index].image != null
              ? Image.asset(categories[index].image.toString().toPng)
              : const SizedBox(),
          categories[index].name == null
              ? const Text('')
              : Text(categories[index].name.toString())
        ],
      ),
    );
  }
}

class Style extends StyleHook {
  @override
  double get activeIconSize => 30;

  @override
  double get activeIconMargin => 10;

  @override
  double get iconSize => 20;

  @override
  TextStyle textStyle(Color color) {
    return TextStyle(fontSize: 20, color: color);
  }
}
