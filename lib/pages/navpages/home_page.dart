import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // Banner
        HomePageBanner(),
        SizedBox(
          height: 10,
        ),
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
      height: 50,
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
      margin: EdgeInsets.symmetric(horizontal: 8),
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Center(
        child: Text(
          label,
          style: TextStyle(fontSize: 18, color: Colors.black),
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
          CarouselSliderItem(),
          SizedBox(
            width: 20,
          ),
          CarouselSliderItem(),
          SizedBox(
            width: 20,
          ),
          CarouselSliderItem(),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }
}

class CarouselSliderItem extends StatelessWidget {
  // final String imgPath;
  // final String

  const CarouselSliderItem({Key? key}) : super(key: key);

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
            padding: EdgeInsets.symmetric(horizontal: 7),
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
          child: Text(
            "Category",
            style: TextStyle(backgroundColor: Colors.red),
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
