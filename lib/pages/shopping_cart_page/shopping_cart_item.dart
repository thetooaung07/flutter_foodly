import 'package:flutter/material.dart';
import 'package:food_order/model/order_counter.dart';
import 'package:food_order/pages/details_page.dart';
import 'package:food_order/providers/cart.dart';
import 'package:provider/provider.dart';

class ShoppingCartItem extends StatelessWidget {
  final CartItem data;
  const ShoppingCartItem({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 75,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                // alignment: Alignment.centerRight,
                repeat: ImageRepeat.noRepeat,
                image: AssetImage(data.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(data.title),
              const SizedBox(
                height: 15,
              ),
              OrderCounter(
                  order: OrderCounterModel(
                id: data.id,
                title: data.title,
                imageUrl: data.imageUrl,
                price: data.price,
              )),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Consumer<Cart>(
                builder: (context, cartProvider, child) => IconButton(
                    onPressed: () => cartProvider.deleteItem(data.id),
                    icon: const Icon(Icons.cancel_rounded)),
              ),
              Text("\$${(data.price * data.quantity).toStringAsFixed(2)}"),
              const SizedBox(
                height: 12,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// @override
// Widget build(BuildContext context) {
//   final String name = "Rider One";

//   return Container(
//     margin: EdgeInsets.only(bottom: 10),
//     padding: EdgeInsets.symmetric(horizontal: 10),
//     height: 80,
//     decoration: BoxDecoration(
//       color: Colors.transparent,
//     ),
//     child: Row(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Container(
//           height: 75,
//           width: 100,
//           decoration: BoxDecoration(
//             borderRadius: const BorderRadius.only(
//               topLeft: Radius.circular(20),
//               bottomLeft: Radius.circular(20),
//             ),
//             image: DecorationImage(
//               // alignment: Alignment.centerRight,
//               repeat: ImageRepeat.noRepeat,
//               image: AssetImage(data.imageUrl),
//               fit: BoxFit.cover,
//             ),
//           ),
//         ),
//         Flexible(
//           child: Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Flexible(
//                   child: RichText(
//                     text: TextSpan(
//                         style: TextStyle(color: Colors.black45),
//                         children: [
//                           TextSpan(
//                               text: "${name}",
//                               style: TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.black54)),
//                           TextSpan(
//                               text:
//                                   " is now heading to your location to deliver your Order.")
//                         ]),
//                     // "${name} is now heading to your location to deliver your Order.",
//                     maxLines: 2,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                 ),
//                 Text(
//                   "2h ago",
//                   style: TextStyle(
//                       fontSize: 14,
//                       fontWeight: FontWeight.w500,
//                       color: Colors.black45),
//                 )
//               ],
//             ),
//           ),
//         ),
//         Container(
//           width: 50,
//           // height: 80,
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(12),
//               image: DecorationImage(
//                   image: AssetImage("assets/images/hot_pot.jpeg"))),
//         ),
//       ],
//     ),
//   );
// }
