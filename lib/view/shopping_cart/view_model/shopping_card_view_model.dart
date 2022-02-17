import '../../product/view_model/product_view_model.dart';
import 'package:mobx/mobx.dart';

import '../../product/model/product.dart';
import '../model/shopping_cart_model.dart';

part 'shopping_card_view_model.g.dart';

class ShoppingCardViewModel = ShoppingCardViewModelBase
    with _$ShoppingCardViewModel;

abstract class ShoppingCardViewModelBase with Store {
  final ProductViewModel _productViewModel = ProductViewModel();

  @observable
  double totalPrice = 0;

  @observable
  ShoppingCartModel shoppingCart = ShoppingCartModel(cart: [
    // CartItem(productId: 1, quantity: 2),
    CartItem(productId: 2, quantity: 1),
    CartItem(productId: 3, quantity: 5),
    CartItem(productId: 4, quantity: 4),
    CartItem(productId: 5, quantity: 2),
  ]);

  @action
  void addProduct(int id) {
    int _index = shoppingCart.cart!.indexWhere((cartItem) {
      return cartItem.productId == id;
    });
    print(_index);
    if (_index >= 0) {
      print('added quantity');
      int _quantity = shoppingCart.cart![_index].quantity!;
      shoppingCart.cart![_index].quantity = _quantity + 1;
      shoppingCart = shoppingCart;
    } else {
      shoppingCart.cart!.add(CartItem(productId: id));
      shoppingCart = shoppingCart;
    }

    calculateTotalPrice();
    print(totalPrice.toString());
    for (var element in shoppingCart.cart!) {
      print(element.quantity.toString());
    }
  }

  @action
  void calculateTotalPrice() {
    for (CartItem cartItem in shoppingCart.cart!) {
      print('calculate: ' + cartItem.quantity.toString());
      for (Product product in _productViewModel.products) {
        if (product.id == cartItem.productId) {
          totalPrice += product.price! * cartItem.quantity!;
        }
      }
    }
  }
}
