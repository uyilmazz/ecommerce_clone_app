import 'package:ecommerce_clone_app/core/extension/string_extension.dart';
import 'package:ecommerce_clone_app/view/product/model/category.dart';
import 'package:ecommerce_clone_app/view/shopping_cart/view/shopping_cart_view.dart';

import '../../../_product/widget/card/product_cart.dart';
import '../../../core/extension/context_extension.dart';
import 'package:flutter/material.dart';

import '../model/product.dart';

class ProductView extends StatefulWidget {
  const ProductView({Key? key}) : super(key: key);

  @override
  _ProductViewState createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  List<String> tabs = ['Ayakkabı', 'Kazak', 'Çanta', 'Mont', 'Jacket', 'Watch'];

  List<Category> categories = [
    Category(name: 'Sneakers', image: 'shoe_thumb_2'),
    Category(name: 'Jacket', image: 'jacket'),
    Category(name: 'Watch', image: 'watch'),
    Category(name: 'Bag', image: 'jacket'),
  ];

  List<Product> products = [
    Product(
        id: 1,
        name: 'Nike Air Max 200',
        category: 'Trending Now',
        price: 240.0,
        imageUrl: 'product_shoe',
        detailImages: [
          'shoe_thumb_1',
          'shoe_thumb_2',
          'shoe_thumb_3',
          'shoe_thumb_4',
          'shoe_thumb_5',
        ],
        availableSize: ['US 6', 'US 7', 'US 8', 'US 9'],
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. ',
        rates: 2),
    Product(
        id: 2,
        name: 'Nike Air Max 97',
        category: 'Trendin Now',
        price: 260.0,
        imageUrl: 'product_shoe2',
        isFavorite: true,
        rates: 3.5),
    Product(
        id: 3,
        name: 'Nike Air Max 92607',
        category: 'Trending Now',
        price: 280.5,
        imageUrl: 'product_shoe'),
    Product(
        id: 4,
        name: 'Nike Air Max Test',
        category: 'Popular',
        price: 120,
        imageUrl: 'product_shoe2'),
    Product(
        id: 5,
        name: 'Nike Air Max 92607',
        category: 'Trending Now',
        price: 280.5,
        imageUrl: 'product_shoe'),
  ];
  int bottomNavigatorSelectedItem = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(),
        bottomNavigationBar: buildBottomNavigatorBar(),
        body: bottomNavigatorSelectedItem == 0
            ? buildOurProductsPage(context)
            : bottomNavigatorSelectedItem == 1
                ? const SizedBox()
                : bottomNavigatorSelectedItem == 2
                    ? ShoppingCart(products: products)
                    : const SizedBox());
  }

  Padding buildOurProductsPage(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.dynamicWidth(0.05)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Our', style: TextStyle(fontSize: 25)),
          const Text('Products',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          const Spacer(),
          Expanded(
              flex: 2,
              child: Row(children: [
                Expanded(child: buildSearchTextField()),
                IconButton(onPressed: () {}, icon: const Icon(Icons.menu))
              ])),
          const Spacer(flex: 2),
          Expanded(flex: 2, child: buildTabMenu()),
          Expanded(flex: 18, child: buildProductListView()),
          const Spacer(flex: 3)
        ],
      ),
    );
  }

  ListView buildProductListView() {
    return ListView.builder(
        shrinkWrap: false,
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Center(
            child:
                ProductCard(product: products[index], iconButtonOnPress: () {}),
          );
        });
  }

  BottomNavigationBar buildBottomNavigatorBar() {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      iconSize: context.dynamicHeight(0.045),
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          label: 'Business',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.school),
          label: 'School',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.school),
          label: 's',
        ),
      ],
      currentIndex: bottomNavigatorSelectedItem,
      selectedItemColor: Colors.amber[800],
      unselectedItemColor: Colors.grey,
      onTap: (selected) {
        setState(() {
          bottomNavigatorSelectedItem = selected;
        });
      },
    );
  }

  Widget buildTabMenu() => ListView(
      scrollDirection: Axis.horizontal,
      children: List.generate(
          categories.length, (index) => buildCategoryCard(index)));

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

  AppBar buildAppBar() {
    return AppBar(
      leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black), onPressed: () {}),
      actions: [
        Padding(
          padding:
              EdgeInsets.only(top: context.lowValue, right: context.lowValue),
          child: CircleAvatar(
            radius: context.mediumValue,
            backgroundImage: AssetImage('assets/images/profile.jpg'),
          ),
        )
      ],
    );
  }

  TextField buildSearchTextField() => TextField(
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
}
