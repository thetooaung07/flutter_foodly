import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class OrderHistoryPage extends StatelessWidget {
  const OrderHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order History"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              SizedBox(
                height: 20,
              ),
              Text(
                "Order History",
                style: TextStyle(fontSize: 25),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                  "The Order History will be automatically \"DELETED\" at the Start of every Month. "),
              SizedBox(height: 20),
              OrderHistoryCard(
                orderIsSuccess: true,
              ),
              OrderHistoryCard(
                orderIsSuccess: false,
              ),
              OrderHistoryCard(
                orderIsSuccess: false,
              ),
              OrderHistoryCard(
                orderIsSuccess: true,
              ),
              OrderHistoryCard(
                orderIsSuccess: true,
              ),
              OrderHistoryCard(
                orderIsSuccess: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OrderHistoryCard extends StatelessWidget {
  final bool orderIsSuccess;
  const OrderHistoryCard({Key? key, required this.orderIsSuccess})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var invoiceNumber = "N1232368";
    var location = "Number(629) Sitke Street, Pyay";

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: DottedBorder(
        borderType: BorderType.RRect,
        radius: const Radius.circular(15),
        color: Colors.black,
        strokeWidth: 2,
        dashPattern: const [5, 5],
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Invoice Number: $invoiceNumber"),
                  const Text("\$25.55"),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(child: Text("Deliver to: $location")),
                  const SizedBox(width: 20),
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
