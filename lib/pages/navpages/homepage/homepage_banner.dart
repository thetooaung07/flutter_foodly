import 'package:flutter/material.dart';

class HomePageBanner extends StatelessWidget {
  const HomePageBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 30, 20, 20),
      width: 200,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.black38,
        image: const DecorationImage(
          alignment: Alignment.center,
          matchTextDirection: true,
          repeat: ImageRepeat.noRepeat,
          image: AssetImage("assets/images/bbq.jpg"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
