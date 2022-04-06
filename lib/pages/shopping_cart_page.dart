import 'package:flutter/material.dart';
import 'package:food_order/pages/navpages/homepage/trending_order.dart';
import 'package:food_order/providers/cart.dart';
import 'package:provider/provider.dart';

class ShoppingCartPage extends StatelessWidget {
  const ShoppingCartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping Cart "),
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: cart.itemCount,
        itemBuilder: (BuildContext context, int index) {
          return TrendingOrderCard(
            data: cart.items.values.toList()[index],
            icon: Icon(Icons.delete_forever_outlined),
            onPressedIcon: () =>
                cart.deleteItem(cart.items.values.toList()[index].id),
          );
        },
      ),
    );
  }
}
