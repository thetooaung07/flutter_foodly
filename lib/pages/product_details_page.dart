import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_order/providers/products.dart';
import 'package:food_order/utils/constants.dart';
import 'package:provider/provider.dart';

class ProductDetailsPage extends StatelessWidget {
  final String productId;
  const ProductDetailsPage({Key? key, required this.productId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    final detailProduct = productData.getProductById(productId);
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: size.height * 0.5,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(detailProduct.imageUrl), fit: BoxFit.cover),
            ),
            child: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: SvgPicture.asset(
                          "assets/images/back_icon.svg",
                          color: Colors.white,
                        )),
                    Row(
                      children: <Widget>[
                        // IconButton(
                        //   onPressed: () {},
                        //   icon: SvgPicture.asset(
                        //     "assets/images/heart_icon.svg",
                        //     color: Colors.white,
                        //   ),
                        // ),
                        SizedBox(
                          width: 20,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            "assets/images/share_icon.svg",
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 80),
            child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(top: size.height * 0.3),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(38)),
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Align(
                        child: Container(
                          width: 150,
                          height: 7,
                          decoration: BoxDecoration(
                              color: categoryUtils
                                      .containsKey(detailProduct.category)
                                  ? categoryUtils[detailProduct.category]![
                                      "color"]
                                  : Colors.black,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Dinner suits the best for your\n${detailProduct.title}",
                        style: TextStyle(fontSize: 20, height: 1.5),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage(detailProduct.imageUrl),
                                    fit: BoxFit.cover)),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Shop Name BBQ",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                "location: Yangon",
                                style: TextStyle(fontSize: 13),
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Text("Delicious"),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(5)),
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Text("Free Delivery"),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(5)),
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Text("High Rating"),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        detailProduct.description,
                        style: TextStyle(height: 1.6),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Gallery",
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: AssetImage(detailProduct.imageUrl),
                                    fit: BoxFit.cover)),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: AssetImage(detailProduct.imageUrl),
                                    fit: BoxFit.cover)),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
