import 'package:flutter/material.dart';

class HomePageBanner extends StatelessWidget {
  const HomePageBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 30, 20, 20),
      height: 100,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        // image: Image(image: ),
        color: Colors.white,
        // boxShadow: [],
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(child: Text("Promotion of the Day")),
    );
  }
}
