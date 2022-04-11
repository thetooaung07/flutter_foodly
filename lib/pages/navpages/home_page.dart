import 'package:flutter/material.dart';
import 'package:food_order/pages/navpages/homepage/carousel_slider.dart';
import 'package:food_order/pages/navpages/homepage/homepage_banner.dart';
import 'package:food_order/pages/navpages/homepage/homepage_intro.dart';
import 'package:food_order/pages/navpages/homepage/horizontal_list_menu.dart';
import 'package:food_order/pages/navpages/homepage/trending_order.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        HomePageIntro(),

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
