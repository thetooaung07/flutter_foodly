import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  final String category;
  bool isInCart;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.category,
    this.isInCart = false,
  });

  void toggleFavouriteStatus() {
    isInCart = !isInCart;
    notifyListeners();
  }

  int _count = 0;

  int get getCount {
    return _count;
  }

  set setCount(int num) {
    _count = num;
    notifyListeners();
  }

  factory Product.fromJson(dynamic json) {
    return Product(
      id: json['id'],
      title: json["title"],
      description: json["description"],
      price: json["price"],
      imageUrl: json["imageUrl"],
      category: json["category"],
    );
  }
}
