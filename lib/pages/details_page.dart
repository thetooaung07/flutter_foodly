import 'package:flutter/material.dart';
import 'package:food_order/components/star_rating_component.dart';
import 'package:food_order/utils/constants.dart';

class DetailsPage extends StatelessWidget {
  final String imgPath;

  const DetailsPage({Key? key, required this.imgPath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      // borderRadius: BorderRadius.circular(BORDER_RADIUS),
                      color: Colors.black38,
                      image: DecorationImage(
                        alignment: Alignment.center,
                        repeat: ImageRepeat.noRepeat,
                        image: new AssetImage(imgPath),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 30,
                    left: 10,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: ButtonBg,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.keyboard_arrow_left_rounded,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 30,
                    right: 10,
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: ButtonBg,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.favorite_border_rounded,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 25, 20, 5),
                child: Text(
                  "Mala Hotpot",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Rating
                    StarRatingComponent(
                      rating: 4.3,
                      isReviewed: true,
                      reviewsCount: 342,
                    ),

                    OrderCounter(),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(20),
                child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam ut orci arcu. Quisque vel massa sapien. Phasellus feugiat dui congue, volutpat magna vel, consectetur magna. Nulla sodales sed ligula ultricies fermentum. Etiam dignissim sollicitudin ex in euismod. Suspendisse potenti. Proin eget fermentum ligula. Sed urna turpis, egestas in egestas at, auctor a metus. Aliquam egestas sapien at velit faucibus lacinia. "),
              )
            ],
          ),
          Container(
            padding: EdgeInsets.fromLTRB(20, 15, 20, 20),
            width: MediaQuery.of(context).size.width,
            height: 80,
            decoration: BoxDecoration(color: Colors.transparent),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Price",
                      style: TextStyle(fontSize: 14),
                    ),
                    Text(
                      r"$15.59",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
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

class OrderCounter extends StatefulWidget {
  const OrderCounter({Key? key}) : super(key: key);

  @override
  State<OrderCounter> createState() => _OrderCounterState();
}

class _OrderCounterState extends State<OrderCounter> {
  int count = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: 120,
      // margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color.fromARGB(61, 235, 235, 235),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                if (count == 1) {
                  return;
                }
                count--;
              });
            },
            child: Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                color: Color.fromARGB(167, 0, 0, 0),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.horizontal_rule_outlined,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
          Text(count.toString()),
          GestureDetector(
            onTap: () {
              setState(() {
                count++;
              });
            },
            child: Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                color: Color.fromARGB(166, 0, 0, 0),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
