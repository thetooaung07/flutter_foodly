import 'package:flutter/material.dart';
import 'package:food_order/pages/shopping_cart_page/shopping_cart_item.dart';
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: cart.itemCount,
              itemBuilder: (BuildContext context, int index) {
                return ShoppingCartItem(
                  data: cart.items.values.toList()[index],
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(20, 15, 20, 20),
            width: MediaQuery.of(context).size.width,
            height: 80,
            decoration: BoxDecoration(color: Colors.transparent),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total Price",
                  style: TextStyle(fontSize: 14),
                ),
                Text(
                  "\$${cart.totalAmount}",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: 45,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Color.fromRGBO(15, 23, 42, 1)),
                      onPressed: () {},
                      child: Text(
                        "Check Out",
                        style: TextStyle(fontSize: 20),
                      )),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
