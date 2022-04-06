import 'package:flutter/material.dart';
import 'package:food_order/model/shopping_cart.dart';

class ShoppingCartProvider extends ChangeNotifier {
  List<ShoppingCart> cartList = [];

  void addItemToCart(ShoppingCart spc) {
    spc.isInCart = true;
    cartList.add(spc);
    // for (var i = 0; i < cartList.length; i++) {
    //   print(cartList[i]);
    // }
    getLengthOfShoppingCart();
    notifyListeners();
  }

  bool isInCart(String imgPath) {
    print("isInCart($imgPath)");
    return cartList.map((e) => e.imgPath == imgPath).length == 0 ? false : true;
  }

  int getLengthOfShoppingCart() {
    print(cartList.length);
    return cartList.length;
  }

  void removeFromCart(int index) {
    cartList.removeAt(index);
    getLengthOfShoppingCart();
    notifyListeners();
  }
}
