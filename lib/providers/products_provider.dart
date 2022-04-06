import 'package:flutter/material.dart';
import 'package:food_order/providers/product.dart';

const CATEGORY_LIST = [
  "All",
  "Recommend",
  "Junk Food",
  "Snack",
  "Lorem",
];

class Products with ChangeNotifier {
  List<Product> _items = [
    Product(
      id: "p1",
      title: "Home BBQ",
      description: "description",
      price: 12.99,
      imageUrl: "assets/images/bbq.jpg",
      category: "Recommend",
    ),
    Product(
      id: "p2",
      title: "Sandwich",
      description: "description",
      price: 12.99,
      imageUrl: "assets/images/sandwich.jpg",
      category: "Junk Food",
    ),
    Product(
      id: "p3",
      title: "Mala Xiang Guo",
      description: "description",
      price: 12.99,
      imageUrl: "assets/images/mala_xg.png",
      category: "Snack",
    )
  ];

  List<Product> get items {
    return [..._items];
  }

  void addProduct() {
    // _items.add(value);
    notifyListeners();
  }

  List<Product> get favouriteItems {
    return _items.where((el) => el.isInCart).toList();
  }
}
