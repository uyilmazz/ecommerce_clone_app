import 'package:mobx/mobx.dart';

import '../model/category.dart';
import '../model/product.dart';

part 'product_view_model.g.dart';

class ProductViewModel = ProductViewModelBase with _$ProductViewModel;

abstract class ProductViewModelBase with Store {
  @observable
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

  @observable
  List<Category> categories = [
    Category(name: 'Sneakers', image: 'shoe_thumb_2'),
    Category(name: 'Jacket', image: 'jacket'),
    Category(name: 'Watch', image: 'watch'),
    Category(name: 'Bag', image: 'jacket'),
  ];

  // @action
  // void productUpate(int id, String name) {
  //   products = products.map((product) {
  //     if (product.id == id) {
  //       product.name = name;
  //     }
  //     return product;
  //   }).toList();
  // }

}
