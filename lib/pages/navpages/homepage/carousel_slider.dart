import 'package:flutter/material.dart';

class CarouselSlider extends StatelessWidget {
  const CarouselSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: 250,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          SizedBox(
            width: 20,
          ),
          CarouselSliderItem(
              imgPath: "imgPath",
              category: "category",
              label: "label",
              waitingTime: "waitingTime"),
          SizedBox(
            width: 20,
          ),
          CarouselSliderItem(
              imgPath: "imgPath",
              category: "category",
              label: "label",
              waitingTime: "waitingTime"),
          SizedBox(
            width: 20,
          ),
          CarouselSliderItem(
              imgPath: "imgPath",
              category: "category",
              label: "label",
              waitingTime: "waitingTime"),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }
}

class CarouselSliderItem extends StatelessWidget {
  final String imgPath;
  final String category;
  final String label;
  final String waitingTime;

  const CarouselSliderItem(
      {Key? key,
      required this.imgPath,
      required this.category,
      required this.label,
      required this.waitingTime})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 200,
          decoration: BoxDecoration(
            color: Colors.black38,
            image: DecorationImage(
              alignment: Alignment.center,
              matchTextDirection: true,
              repeat: ImageRepeat.noRepeat,
              image: new AssetImage('assets/images/sandwich.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(color: Colors.red),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text("Pork Noodles"), Text("30 Min | 1 serving")],
                ),
                Text("Icon here"),
              ],
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          child: Container(
            padding: EdgeInsets.all(8),
            child: Text(
              "Category",
              style: TextStyle(backgroundColor: Colors.red),
            ),
          ),
        ),
      ],
    );
  }
}
