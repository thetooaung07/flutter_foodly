import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class OrderHistoryPage extends StatelessWidget {
  const OrderHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Order History"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("Order History"),
            Text(
                "Lorem Ipsum asfaf dkafljka adkfjakdfj akjdfklafjdkjadf adkfjakdf. aldkfjlasdf."),
            SizedBox(height: 30),
            OrderHistoryCard(),
            OrderHistoryCard(),
            OrderHistoryCard(),
            OrderHistoryCard(),
            OrderHistoryCard(),
            OrderHistoryCard(),
          ],
        ),
      ),
    );
  }
}

class OrderHistoryCard extends StatelessWidget {
  const OrderHistoryCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var invoiceNumber = "N1232368";
    var location = "Number(629) Sitke Street, Pyay";
    var orderIsSuccess = true;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: DottedBorder(
        borderType: BorderType.RRect,
        radius: Radius.circular(15),
        color: Colors.black,
        strokeWidth: 2,
        dashPattern: [5, 5],
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Invoice Number: ${invoiceNumber}"),
                  Text("\$25.55"),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(child: Text("Deliver to: ${location}")),
                  SizedBox(width: 20),
                  Icon(
                    orderIsSuccess
                        ? Icons.check_circle_rounded
                        : Icons.cancel_rounded,
                    size: 35,
                    color: orderIsSuccess ? Colors.green : Colors.red,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
