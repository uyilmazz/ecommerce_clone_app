import 'package:json_annotation/json_annotation.dart';

part 'shopping_cart_model.g.dart';

@JsonSerializable()
class CartItem {
  int? productId;
  int? quantity;

  CartItem({this.productId, this.quantity});

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return _$CartItemFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CartItemToJson(this);
}
