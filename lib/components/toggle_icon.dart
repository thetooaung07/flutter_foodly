import 'package:flutter/material.dart';
import 'package:food_order/providers/cart.dart';
import 'package:food_order/providers/product.dart';
import 'package:provider/provider.dart';

class ToggleIcon extends StatelessWidget {
  const ToggleIcon({Key? key}) : super(key: key);

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
                  : Icons.favorite_border_rounded,
              color: Colors.white,
            ),
          )),
    );
  }
}
