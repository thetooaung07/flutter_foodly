import 'package:flutter/material.dart';
import 'package:food_order/components/star_rating_component.dart';
import 'package:food_order/providers/cart.dart';
import 'package:food_order/providers/products.dart';
import 'package:provider/provider.dart';

class TrendingOrder extends StatelessWidget {
  const TrendingOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context).items;

    return Container(
        margin: const EdgeInsets.all(15),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 7),
                    child: Text(
                      "Trending 🔥",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Text("See all "),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            for (var item in products)
              TrendingOrderCard(
                  data: CartItem(
                      id: item.id,
                      price: item.price,
                      quantity: 1,
                      imageUrl: item.imageUrl,
                      title: item.title),
                  icon: const Icon(Icons.keyboard_arrow_right_rounded),
                  onPressedCard: () => Navigator.of(context)
                      .pushNamed("details_page", arguments: item.id)),
          ],
        ));
  }
}

class TrendingOrderCard extends StatelessWidget {
  final CartItem data;
  final Icon icon;
  final Function()? onPressedIcon;
  final Function()? onPressedCard;
  const TrendingOrderCard(
      {Key? key,
      required this.data,
      required this.icon,
      this.onPressedIcon,
      this.onPressedCard})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onPressedCard,
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                  left: 10.0, top: 5.0, right: 10.0, bottom: 5.0),
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  minHeight: 70,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage(data.imageUrl),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(8.0, 5.0, 0.0, 5.0),
                      width: MediaQuery.of(context).size.width * .60,
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            data.title.toString(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            // style: CustomTextStyle.textSubtitle2BlackShades(context),
                          ),
                          const StarRatingComponent(
                            rating: 4.3,
                            ratingTextStyle: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: onPressedIcon,
                      child: icon,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
