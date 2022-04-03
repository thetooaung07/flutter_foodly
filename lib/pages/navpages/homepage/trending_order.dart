import 'package:flutter/material.dart';

class TrendingOrder extends StatelessWidget {
  const TrendingOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Text(
        "Trending Order",
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
