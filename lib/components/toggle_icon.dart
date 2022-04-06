import 'package:flutter/material.dart';
import 'package:food_order/providers/cart.dart';
import 'package:food_order/providers/product.dart';
import 'package:provider/provider.dart';

class ToggleIcon extends StatelessWidget {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return Consumer<Product>(
      builder: ((context, product, _) => GestureDetector(
            onTap: () {
              if (cart.items.containsKey(product.id)) {
                cart.deleteItem(product.id);
              } else {
                product.toggleFavouriteStatus();
                cart.addItem(
                    product.id, product.price, product.title, product.imageUrl);
              }
            },
            child: Icon(
              cart.items.containsKey(product.id)
                  ? Icons.delete
                  : Icons.shopping_cart_checkout_outlined,
              color: Colors.white,
            ),
          )),
    );
  }
}
