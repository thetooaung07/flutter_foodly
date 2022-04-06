import 'package:flutter/material.dart';
import 'package:food_order/providers/cart.dart';

class ShoppingCartItem extends StatelessWidget {
  final CartItem data;
  const ShoppingCartItem({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 15, 20, 0),
      padding: EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          boxShadow: [
            BoxShadow(
                color: Color.fromARGB(143, 117, 117, 117),
                offset: Offset(1, 1.5), //(x,y)
                blurRadius: 2.0,
                spreadRadius: 0),
          ],
          border: Border.all(color: Color.fromARGB(64, 0, 0, 0)),
          borderRadius: BorderRadius.circular(20)),
      child: IntrinsicHeight(
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 75,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
                image: DecorationImage(
                  // alignment: Alignment.centerRight,
                  repeat: ImageRepeat.noRepeat,
                  image: new AssetImage(data.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: 30,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(data.title),
                  SizedBox(
                    height: 10,
                  ),
                  Text("\$${data.price} x ${data.quantity}"),
                ],
              ),
            ),
            VerticalDivider(
              color: Color.fromARGB(255, 0, 0, 0),
              thickness: 2,
            ),
            SizedBox(
              width: 10,
            ),
            Text("\$${data.price * data.quantity}"),
          ],
        ),
      ),
    );
  }
}
