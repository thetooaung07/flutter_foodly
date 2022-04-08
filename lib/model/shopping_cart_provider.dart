import 'package:flutter/material.dart';
import 'package:food_order/model/shopping_cart.dart';

class ShoppingCartProvider extends ChangeNotifier {
  List<ShoppingCart> cartList = [];

  void addItemToCart(ShoppingCart spc) {
    spc.isInCart = true;
    cartList.add(spc);
    getLengthOfShoppingCart();
    notifyListeners();
  }

  bool isInCart(String imgPath) {
    return cartList.map((e) => e.imgPath == imgPath).isEmpty ? false : true;
  }

  int getLengthOfShoppingCart() {
    return cartList.length;
  }

  void removeFromCart(int index) {
    cartList.removeAt(index);
    getLengthOfShoppingCart();
    notifyListeners();
  }
}
