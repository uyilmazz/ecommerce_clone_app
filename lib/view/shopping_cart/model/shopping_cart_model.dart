class ShoppingCartModel {
  List<Map<String, int>>? cart;

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
