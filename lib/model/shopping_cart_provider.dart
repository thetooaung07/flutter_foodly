import 'package:flutter/cupertino.dart';
import 'package:food_order/model/shopping_cart.dart';

class ShoppingCartProvider extends ChangeNotifier {
  List<ShoppingCart> cartList = [];

  void addItemToCart(ShoppingCart spc) {
    spc.isInCart = true;
    cartList.add(spc);
    // for (var i = 0; i < cartList.length; i++) {
    //   print(cartList[i]);
    // }
    notifyListeners();
  }
}
