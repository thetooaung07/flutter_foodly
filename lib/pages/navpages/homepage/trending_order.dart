import 'package:flutter/material.dart';
import 'package:food_order/components/star_rating_component.dart';

class TrendingOrder extends StatelessWidget {
  const TrendingOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          TrendingOrderCard(),
          TrendingOrderCard(),
          TrendingOrderCard(),
          TrendingOrderCard(),
        ],
      ),
    );
  }
}

class TrendingOrderCard extends StatelessWidget {
  const TrendingOrderCard({Key? key}) : super(key: key);

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
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage("assets/images/burger.jpg"),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(8.0, 5.0, 0.0, 5.0),
                      width: MediaQuery.of(context).size.width * .60,
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Burger",
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
                      child: Icon(Icons.keyboard_arrow_right_rounded),
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
