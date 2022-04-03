import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // Banner
        HomePageBanner(),

        // horizontal scroll bubble
        HorizontalListMenu(),
        SizedBox(
          height: 10,
        ),
        // result from horizontal scroll bubble Carousel
        CarouselSlider(),
        // Popular   instead of Near You (Map)
        TrendingOrder(),
      ],
    );
  }
}

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

class HorizontalListMenu extends StatelessWidget {
  const HorizontalListMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: 40,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          HorizontalListItem(
            label: "Recommend",
            onPressed: () {},
          ),
          HorizontalListItem(
            label: "Junk Food",
            onPressed: () {},
          ),
          HorizontalListItem(
            label: "Vegan",
            onPressed: () {},
          ),
          HorizontalListItem(
            label: "Beef",
            onPressed: () {},
          ),
          SizedBox(
            width: 15,
          )
        ],
      ),
    );
  }
}

class HorizontalListItem extends StatelessWidget {
  final String label;
  final Function() onPressed;

  const HorizontalListItem({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(20),
      ),
      margin: EdgeInsets.only(left: 10),
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Center(
        child: Text(
          label,
          style: TextStyle(fontSize: 14, color: Colors.black),
        ),
      ),
    );
  }
}

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
