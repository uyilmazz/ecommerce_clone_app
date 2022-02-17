class ShoppingCartModel {
  List<CartItem>? cart;

  ShoppingCartModel({
    this.cart,
  });

  ShoppingCartModel.fromJson(Map<String, dynamic> json) {
    cart = json['cart'];
  }

  Map<String, dynamic> toJson() => {
        "cart": cart,
      };
}

class CartItem {
  int? productId;
  int? quantity;

  CartItem({
    required this.productId,
    this.quantity = 1,
  });

  CartItem.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() =>
      {"productId": productId, "quantity": quantity};
}
