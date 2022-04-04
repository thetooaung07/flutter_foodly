import 'package:flutter/material.dart';
import 'package:food_order/model/shopping_cart.dart';
import 'package:food_order/model/shopping_cart_provider.dart';
import 'package:provider/provider.dart';

const double BORDER_RADIUS = 20;

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
              imgPath: "assets/images/bbq.jpg",
              category: "Recommend",
              label: "Home BBQ",
              waitingTime: "30 min | 3 serving"),
          SizedBox(
            width: 20,
          ),
          CarouselSliderItem(
              imgPath: "assets/images/sandwich.jpg",
              category: "Snack",
              label: "Sandwich",
              waitingTime: "0 min | Ready"),
          SizedBox(
            width: 20,
          ),
          CarouselSliderItem(
              imgPath: "assets/images/mala_xg.png",
              category: "Junk Food",
              label: "Mala Xiang Guo",
              waitingTime: "10 min | 1 serving"),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }
}

class CarouselSliderItem extends StatelessWidget {
  // ShoppingCart()

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
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed("detail_page", arguments: imgPath);
      },
      child: Stack(
        children: [
          Hero(
            tag: imgPath,
            child: Container(
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(BORDER_RADIUS),
                color: Colors.black38,
                image: DecorationImage(
                  alignment: Alignment.center,
                  matchTextDirection: true,
                  repeat: ImageRepeat.noRepeat,
                  image: new AssetImage(imgPath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                  color: Color.fromARGB(153, 0, 0, 0),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(BORDER_RADIUS),
                    bottomRight: Radius.circular(BORDER_RADIUS),
                  )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        label,
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        waitingTime,
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Provider.of<ShoppingCartProvider>(context, listen: false)
                          .addItemToCart(
                        ShoppingCart(
                          imgPath: imgPath,
                          category: category,
                          label: label,
                          waitingTime: waitingTime,
                          description: "Somethings",
                        ),
                      );
                    },
                    child: Icon(
                      Icons.shopping_cart_checkout_outlined,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 10,
            left: 10,
            child: CategoryItem(
              category: category,
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String category;

  const CategoryItem({Key? key, required this.category}) : super(key: key);
// #5A5859
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 3, 10, 3),
      decoration: BoxDecoration(
        color: Color.fromARGB(153, 0, 0, 0),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        category,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
