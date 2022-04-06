import 'package:flutter/material.dart';
import 'package:food_order/providers/product.dart';

const CATEGORY_LIST = [
  "All",
  "Recommend",
  "Junk Food",
  "Snack",
  "Lorem",
  "Ipsum",
];

class Products with ChangeNotifier {
  String getCategory = CATEGORY_LIST[0];
  String get getSelectedCategory {
    return getCategory;
  }

  void set setSelectedCategory(String category) {
    print("Setter is called ${category}");
    getCategory = category;
    notifyListeners();
  }

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
    ),
    Product(
      id: "p4",
      title: "Hot Pot",
      description: "description",
      price: 12.99,
      imageUrl: "assets/images/hot_pot.jpeg",
      category: "Recommend",
    ),
    Product(
      id: "p5",
      title: "Pork Noodle",
      description: "description",
      price: 12.99,
      imageUrl: "assets/images/pork_noodle.jpg",
      category: "Junk Food",
    ),
    Product(
      id: "p6",
      title: "Burger",
      description: "description",
      price: 12.99,
      imageUrl: "assets/images/burger.jpg",
      category: "Snack",
    ),
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

  // List<Product> filterByCategory(String category) {
  //   print("FilterbyCategory is called");
  //   List<Product> result = [];

  //   _items.forEach((element) {
  //     if (element.category == category) {
  //       print("element.id ${element.id}");
  //       result.add(element);
  //     } else
  //       return;
  //   });

  //   print("result.length ${result.length}");

  //   notifyListeners();
  //   return result;
  // }
}
