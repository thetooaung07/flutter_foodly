import 'package:flutter/material.dart';
import 'package:food_order/model/shopping_cart_provider.dart';
import 'package:food_order/pages/navpages/homepage/carousel_slider.dart';
import 'package:food_order/pages/navpages/homepage/trending_order.dart';
import 'package:provider/provider.dart';

class ShoppingCartPage extends StatelessWidget {
  const ShoppingCartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping Cart "),
      ),
      body: Consumer<ShoppingCartProvider>(
        builder: (context, value, child) {
          print(value.cartList.length);
          return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: value.cartList.length,
              itemBuilder: (BuildContext context, int index) {
                return TrendingOrderCard(
                  data: value.cartList[index],
                );
              });
        },
      ),
    );
  }
}
