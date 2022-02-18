import 'package:flutter/material.dart';

import '../../product/model/product.dart';
import '../../product/view_model/product_view_model.dart';
import '../model/shopping_cart_model.dart';

class ShoppingCardViewModel extends ChangeNotifier {
  final ProductViewModel _productViewModel = ProductViewModel();

  double _totalPrice = 0;

  List<CartItem> _cartItems = [
    CartItem(productId: 2, quantity: 1),
    CartItem(productId: 3, quantity: 5),
    CartItem(productId: 4, quantity: 4),
    CartItem(productId: 5, quantity: 2),
  ];

  List<CartItem> get cartItems => _cartItems;
  double get totalPrice => _totalPrice;

  void addProduct(int id) {
    int _index = _cartItems.indexWhere((cartItem) {
      return cartItem.productId == id;
    });
    if (_index >= 0) {
      int _quantity = _cartItems[_index].quantity! + 1;
      _cartItems[_index].quantity = _quantity;
    } else {
      _cartItems.add(CartItem(productId: id, quantity: 1));
    }
    calculateTotalPrice();
    notifyListeners();
  }

  void calculateTotalPrice() {
    double total = 0;
    for (CartItem cartItem in _cartItems) {
      for (Product product in _productViewModel.products) {
        if (product.id == cartItem.productId) {
          total += product.price! * cartItem.quantity!;
        }
      }
    }
    _totalPrice = total;
  }
}
