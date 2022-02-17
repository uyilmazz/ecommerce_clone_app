// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_card_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ShoppingCardViewModel on ShoppingCardViewModelBase, Store {
  final _$shoppingCartAtom =
      Atom(name: 'ShoppingCardViewModelBase.shoppingCart');

  @override
  ShoppingCartModel get shoppingCart {
    _$shoppingCartAtom.reportRead();
    return super.shoppingCart;
  }

  @override
  set shoppingCart(ShoppingCartModel value) {
    _$shoppingCartAtom.reportWrite(value, super.shoppingCart, () {
      super.shoppingCart = value;
    });
  }

  final _$totalPriceAtom = Atom(name: 'ShoppingCardViewModelBase.totalPrice');

  @override
  double get totalPrice {
    _$totalPriceAtom.reportRead();
    return super.totalPrice;
  }

  @override
  set totalPrice(double value) {
    _$totalPriceAtom.reportWrite(value, super.totalPrice, () {
      super.totalPrice = value;
    });
  }

  final _$ShoppingCardViewModelBaseActionController =
      ActionController(name: 'ShoppingCardViewModelBase');

  @override
  void addProduct(int id) {
    final _$actionInfo = _$ShoppingCardViewModelBaseActionController
        .startAction(name: 'ShoppingCardViewModelBase.addProduct');
    try {
      return super.addProduct(id);
    } finally {
      _$ShoppingCardViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void calculateTotalPrice() {
    final _$actionInfo = _$ShoppingCardViewModelBaseActionController
        .startAction(name: 'ShoppingCardViewModelBase.calculateTotalPrice');
    try {
      return super.calculateTotalPrice();
    } finally {
      _$ShoppingCardViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
shoppingCart: ${shoppingCart},
totalPrice: ${totalPrice}
    ''';
  }
}
