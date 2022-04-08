import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;
  final String imageUrl;

  CartItem({
    required this.id,
    required this.title,
    required this.quantity,
    required this.price,
    required this.imageUrl,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};
  Map<String, CartItem> get items {
    return {..._items};
  }

  void addItem(String productId, double price, String title, String imageUrl) {
    if (_items.containsKey(productId)) {
      // change only quantity
      _items.update(
        productId,
        (existingCartItem) => CartItem(
            id: existingCartItem.id,
            title: existingCartItem.title,
            imageUrl: existingCartItem.imageUrl,
            quantity: existingCartItem.quantity + 1,
            price: existingCartItem.price),
      );
    } else {
      _items.putIfAbsent(
        productId,
        () => CartItem(
            id: productId,
            title: title,
            quantity: 1,
            imageUrl: imageUrl,
            price: price),
      );
    }

    notifyListeners();
  }

  int get itemCount {
    return _items.isEmpty ? 0 : _items.length;
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });

    return total;
  }

  void deleteItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  CartItem? getCartItemById(String id) {
    if (_items.containsKey(id)) {
      return _items[id]!;
    } else
      return null;
  }

// Reduce Quantity of the existing CartItem

  void reduceQuantity(String id) {
    final result = getCartItemById(id);
    if (result == null) {
      return;
    } else {
      final result2 = _items.update(
        id,
        (existingCartItem) => CartItem(
            id: existingCartItem.id,
            title: existingCartItem.title,
            imageUrl: existingCartItem.imageUrl,
            quantity: existingCartItem.quantity - 1,
            price: existingCartItem.price),
      );
      // Delete CartItem if Quantity is 0
      if (result2.quantity == 0) {
        deleteItem(id);
      }
    }

    notifyListeners();
  }
}
