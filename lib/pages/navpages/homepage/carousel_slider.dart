import 'package:flutter/material.dart';
import 'package:food_order/components/toggle_icon.dart';
import 'package:food_order/providers/product.dart';
import 'package:food_order/providers/products.dart';
import 'package:food_order/utils/constants.dart';
import 'package:provider/provider.dart';

const double borderRadiusConstant = 20;

class CarouselSlider extends StatelessWidget {
  const CarouselSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    final products = productData.items;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      height: 250,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          if (productData.getCategory == "All") ...[
            for (var item in products)
              Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  ChangeNotifierProvider.value(
                    value: item,
                    child: CarouselSliderItem(
                      product: item,
                    ),
                  )
                ],
              ),
          ] else ...[
            for (var item in products) ...[
              if (item.category == productData.getCategory) ...[
                Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    ChangeNotifierProvider.value(
                      value: item,
                      child: CarouselSliderItem(
                        product: item,
                      ),
                    )
                  ],
                )
              ]
            ]
          ],
          const SizedBox(width: 20),
        ],
      ),
    );
  }
}

class CarouselSliderItem extends StatelessWidget {
  final Product product;

  const CarouselSliderItem({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed("details_page", arguments: product.id);
      },
      child: Stack(
        children: [
          Container(
            width: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadiusConstant),
              color: Colors.black38,
              image: DecorationImage(
                alignment: Alignment.center,
                matchTextDirection: true,
                repeat: ImageRepeat.noRepeat,
                image: AssetImage(product.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: const BoxDecoration(
                  color: Color.fromARGB(153, 0, 0, 0),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(borderRadiusConstant),
                    bottomRight: Radius.circular(borderRadiusConstant),
                  )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.title,
                        style: const TextStyle(color: Colors.white),
                      ),
                      Text(
                        "\$${product.price.toString()}",
                        style: const TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                  GestureDetector(
                    child: const ToggleIcon(),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 10,
            left: 10,
            child: CategoryItem(
              category: product.category.toString(),
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
      padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
      decoration: BoxDecoration(
        color: const Color.fromARGB(153, 0, 0, 0),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        categoryUtils.containsKey(category)
            ? "${categoryUtils[category]!["emoji"]}  $category"
            : "$category",
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
