import 'package:flutter/material.dart';
import 'package:food_order/model/OrderCounter.dart';
import 'package:food_order/providers/cart.dart';
import 'package:food_order/providers/product.dart';
import 'package:food_order/providers/products.dart';
import 'package:provider/provider.dart';

class DetailsPage extends StatelessWidget {
  final String productId;

  const DetailsPage({Key? key, required this.productId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    final detailProduct = productData.getProductById(productId);
    final cart = Provider.of<Cart>(context);
    final cartItem = cart.getCartItemById(productId);

    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 20),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                  image: AssetImage(detailProduct.imageUrl),
                  fit: BoxFit.fitHeight,
                  alignment: Alignment.center,
                  matchTextDirection: true,
                  repeat: ImageRepeat.noRepeat,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.7,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.7),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    )),
              ),
            )
          ],
        ));
  }
}

class OrderCounter extends StatefulWidget {
  final OrderCounterModel order;
  const OrderCounter({Key? key, required this.order}) : super(key: key);

  @override
  State<OrderCounter> createState() => _OrderCounterState();
}

class _OrderCounterState extends State<OrderCounter> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    final cartItem = cart.getCartItemById(widget.order.id);
    return Container(
      height: 35,
      width: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: cartItem!.quantity <= 1
                ? null
                : () {
                    cart.reduceQuantity(widget.order.id);
                  },
            child: Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.transparent,
                border: Border.all(color: Colors.black),
              ),
              child: const Icon(
                Icons.horizontal_rule_outlined,
                color: Colors.black,
                size: 20,
              ),
            ),
          ),
          Text(cartItem == null ? "0" : cartItem.quantity.toString()),
          GestureDetector(
            onTap: () {
              cart.addItem(widget.order.id, widget.order.price,
                  widget.order.title, widget.order.imageUrl);
            },
            child: Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.transparent,
                border: Border.all(color: Colors.black),
              ),
              child: const Icon(
                Icons.add,
                color: Colors.black,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
// Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Stack(
//                 children: [
//                   Container(
//                     height: MediaQuery.of(context).size.height * 0.4,
//                     width: MediaQuery.of(context).size.width,
//                     decoration: BoxDecoration(
//                       // borderRadius: BorderRadius.circular(BORDER_RADIUS),
//                       color: Colors.black38,
//                       image: DecorationImage(
//                         alignment: Alignment.center,
//                         repeat: ImageRepeat.noRepeat,
//                         image: AssetImage(detailProduct.imageUrl),
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     top: 30,
//                     left: 10,
//                     child: GestureDetector(
//                       onTap: () {
//                         Navigator.of(context).pop();
//                       },
//                       child: Container(
//                         width: 40,
//                         height: 40,
//                         decoration: const BoxDecoration(
//                           color: buttonBg,
//                           shape: BoxShape.circle,
//                         ),
//                         child: const Icon(
//                           Icons.keyboard_arrow_left_rounded,
//                           color: Colors.white,
//                           size: 30,
//                         ),
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     top: 30,
//                     right: 10,
//                     child: GestureDetector(
//                       onTap: () {},
//                       child: Container(
//                         width: 40,
//                         height: 40,
//                         decoration: const BoxDecoration(
//                           color: buttonBg,
//                           shape: BoxShape.circle,
//                         ),
//                         child: const Icon(
//                           Icons.favorite_border_rounded,
//                           color: Colors.white,
//                           size: 20,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               Container(
//                 margin: const EdgeInsets.fromLTRB(20, 25, 20, 5),
//                 child: Text(
//                   detailProduct.title,
//                   style: const TextStyle(
//                       fontSize: 25, fontWeight: FontWeight.w800),
//                 ),
//               ),
//               Container(
//                 margin: const EdgeInsets.symmetric(horizontal: 20),
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     // Rating
//                     const StarRatingComponent(
//                       rating: 4.3,
//                       isReviewed: true,
//                       reviewsCount: 342,
//                     ),

//                     OrderCounter(product: detailProduct),
//                   ],
//                 ),
//               ),
//               Container(
//                 margin: const EdgeInsets.all(20),
//                 child: Text(detailProduct.description),
//               )
//             ],
//           ),
//           Container(
//             padding: const EdgeInsets.fromLTRB(20, 15, 20, 20),
//             width: MediaQuery.of(context).size.width,
//             height: 80,
//             decoration: const BoxDecoration(color: Colors.transparent),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text(
//                       "Price",
//                       style: TextStyle(fontSize: 14),
//                     ),
//                     Text(
//                       "\$${detailProduct.price * (cartItem == null ? 0 : cartItem.quantity)}",
//                       style: const TextStyle(fontSize: 20),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   width: MediaQuery.of(context).size.width * 0.7,
//                   height: 45,
//                   child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                           primary: const Color.fromRGBO(15, 23, 42, 1)),
//                       onPressed: () {
//                         Navigator.of(context).pushNamed("shopping_cart_page");
//                       },
//                       child: const Text(
//                         "Check Out",
//                         style: TextStyle(fontSize: 20),
//                       )),
//                 )
//               ],
//             ),
//           ),
//         ],
//       ),