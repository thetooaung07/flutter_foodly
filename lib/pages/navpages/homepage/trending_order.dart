import 'package:flutter/material.dart';
import 'package:food_order/components/star_rating_component.dart';
import 'package:food_order/model/shopping_cart.dart';

class TrendingOrder extends StatelessWidget {
  const TrendingOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<ShoppingCart> ListData = [
      ShoppingCart(
          imgPath: "assets/images/bbq.jpg",
          category: "Recommend",
          label: "Home BBQ",
          waitingTime: "30 min | 3 serving"),
      ShoppingCart(
          imgPath: "assets/images/sandwich.jpg",
          category: "Snack",
          label: "Sandwich",
          waitingTime: "0 min | Ready"),
      ShoppingCart(
          imgPath: "assets/images/mala_xg.png",
          category: "Junk Food",
          label: "Mala Xiang Guo",
          waitingTime: "10 min | 1 serving"),
      ShoppingCart(
          imgPath: "assets/images/bbq.jpg",
          category: "Recommend",
          label: "Home BBQ",
          waitingTime: "30 min | 3 serving"),
    ];
    return Container(
      margin: EdgeInsets.all(15),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 7),
                  child: Text(
                    "Trending",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                Icon(Icons.trending_up_rounded),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TrendingOrderCard(
              data: ListData[0],
              icon: Icon(Icons.keyboard_arrow_right_rounded),
              onPressed: () => null),
          TrendingOrderCard(
              data: ListData[1],
              icon: Icon(Icons.keyboard_arrow_right_rounded),
              onPressed: () => null),
          TrendingOrderCard(
              data: ListData[2],
              icon: Icon(Icons.keyboard_arrow_right_rounded),
              onPressed: () => null),
          TrendingOrderCard(
              data: ListData[3],
              icon: Icon(Icons.keyboard_arrow_right_rounded),
              onPressed: () => null),
        ],
      ),
    );
  }
}

class TrendingOrderCard extends StatelessWidget {
  final ShoppingCart data;
  final Icon icon;
  final Function() onPressed;
  const TrendingOrderCard(
      {Key? key,
      required this.data,
      required this.icon,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {},
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                  left: 10.0, top: 5.0, right: 10.0, bottom: 5.0),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: 70,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage(data.imgPath),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(8.0, 5.0, 0.0, 5.0),
                      width: MediaQuery.of(context).size.width * .60,
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            data.label.toString(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            // style: CustomTextStyle.textSubtitle2BlackShades(context),
                          ),
                          StarRatingComponent(
                            rating: 4.3,
                            ratingTextStyle: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
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
