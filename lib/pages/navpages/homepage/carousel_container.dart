import 'package:flutter/material.dart';
import 'package:food_order/pages/navpages/homepage/carousel_slider.dart';
import 'package:food_order/pages/navpages/homepage/horizontal_list_menu.dart';

class CarouselContainer extends StatefulWidget {
  const CarouselContainer({Key? key}) : super(key: key);

  @override
  State<CarouselContainer> createState() => _CarouselContainerState();
}

class _CarouselContainerState extends State<CarouselContainer> {
  int currentIdx = 0;

  void changeState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      // List Menu
      HorizontalListMenu(
        onPressed: changeState,
        currentIdx: currentIdx,
      ),
      // result from horizontal scroll bubble Carousel
      CarouselSlider(),
    ]);
  }
}
