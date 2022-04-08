import 'package:flutter/material.dart';
import 'package:food_order/providers/product.dart';

const categoryListConstant = [
  "All",
  "Recommend",
  "Junk Food",
  "Snack",
  "Lorem",
  "Ipsum",
];

class Products with ChangeNotifier {
  String getCategory = categoryListConstant[0];
  String get getSelectedCategory {
    return getCategory;
  }

  set setSelectedCategory(String category) {
    getCategory = category;
    notifyListeners();
  }

  final List<Product> _items = [
    Product(
      id: "p1",
      title: "Home BBQ",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam ut orci arcu. Quisque vel massa sapien. Phasellus feugiat dui congue, volutpat magna vel, consectetur magna. Nulla sodales sed ligula ultricies fermentum. Etiam dignissim sollicitudin ex in euismod. Suspendisse potenti. Proin eget fermentum ligula. Sed urna turpis, egestas in egestas at, auctor a metus. Aliquam egestas sapien at velit faucibus lacinia. ",
      price: 12.99,
      imageUrl: "assets/images/bbq.jpg",
      category: "Recommend",
    ),
    Product(
      id: "p2",
      title: "Sandwich",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam ut orci arcu. Quisque vel massa sapien. Phasellus feugiat dui congue, volutpat magna vel, consectetur magna. Nulla sodales sed ligula ultricies fermentum. Etiam dignissim sollicitudin ex in euismod. Suspendisse potenti. Proin eget fermentum ligula. Sed urna turpis, egestas in egestas at, auctor a metus. Aliquam egestas sapien at velit faucibus lacinia. ",
      price: 9.99,
      imageUrl: "assets/images/sandwich.jpg",
      category: "Junk Food",
    ),
    Product(
      id: "p3",
      title: "Mala Xiang Guo",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam ut orci arcu. Quisque vel massa sapien. Phasellus feugiat dui congue, volutpat magna vel, consectetur magna. Nulla sodales sed ligula ultricies fermentum. Etiam dignissim sollicitudin ex in euismod. Suspendisse potenti. Proin eget fermentum ligula. Sed urna turpis, egestas in egestas at, auctor a metus. Aliquam egestas sapien at velit faucibus lacinia. ",
      price: 25.99,
      imageUrl: "assets/images/mala_xg.png",
      category: "Snack",
    ),
    Product(
      id: "p4",
      title: "Hot Pot",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam ut orci arcu. Quisque vel massa sapien. Phasellus feugiat dui congue, volutpat magna vel, consectetur magna. Nulla sodales sed ligula ultricies fermentum. Etiam dignissim sollicitudin ex in euismod. Suspendisse potenti. Proin eget fermentum ligula. Sed urna turpis, egestas in egestas at, auctor a metus. Aliquam egestas sapien at velit faucibus lacinia. ",
      price: 20.99,
      imageUrl: "assets/images/hot_pot.jpeg",
      category: "Recommend",
    ),
    Product(
      id: "p5",
      title: "Pork Noodle",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam ut orci arcu. Quisque vel massa sapien. Phasellus feugiat dui congue, volutpat magna vel, consectetur magna. Nulla sodales sed ligula ultricies fermentum. Etiam dignissim sollicitudin ex in euismod. Suspendisse potenti. Proin eget fermentum ligula. Sed urna turpis, egestas in egestas at, auctor a metus. Aliquam egestas sapien at velit faucibus lacinia. ",
      price: 5.99,
      imageUrl: "assets/images/pork_noodle.jpg",
      category: "Junk Food",
    ),
    Product(
      id: "p6",
      title: "Burger",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam ut orci arcu. Quisque vel massa sapien. Phasellus feugiat dui congue, volutpat magna vel, consectetur magna. Nulla sodales sed ligula ultricies fermentum. Etiam dignissim sollicitudin ex in euismod. Suspendisse potenti. Proin eget fermentum ligula. Sed urna turpis, egestas in egestas at, auctor a metus. Aliquam egestas sapien at velit faucibus lacinia. ",
      price: 9.99,
      imageUrl: "assets/images/burger.jpg",
      category: "Snack",
    ),
  ];

  List<Product> get items {
    return [..._items];
  }

  Product getProductById(String id) {
    return _items.firstWhere((element) => element.id == id);
  }

  void addProduct() {
    // _items.add(value);
    notifyListeners();
  }

  List<Product> get favouriteItems {
    return _items.where((el) => el.isInCart).toList();
  }
}
