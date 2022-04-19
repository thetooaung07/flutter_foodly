import 'package:flutter/material.dart';

class CheckOutConfirmPage extends StatefulWidget {
  const CheckOutConfirmPage({Key? key}) : super(key: key);

  @override
  State<CheckOutConfirmPage> createState() => _CheckOutConfirmPageState();
}

class _CheckOutConfirmPageState extends State<CheckOutConfirmPage> {
  final paymentLabels = [
    'Credit card / Debit card',
    'Cash on delivery',
    'Paypal',
    'Google wallet',
  ];

  final paymentIcons = [
    Icons.credit_card,
    Icons.money_off,
    Icons.payment,
    Icons.account_balance_wallet,
  ];
  int value = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Check Out")),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Choose your payment method',
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.separated(
              itemCount: paymentLabels.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    setState(() {
                      value = index;
                    });
                  },
                  leading: Radio(
                    activeColor: Colors.red,
                    value: index,
                    groupValue: value,
                    onChanged: (i) {},
                  ),
                  title: Text(
                    paymentLabels[index],
                    style: const TextStyle(color: Colors.black),
                  ),
                  trailing: Icon(paymentIcons[index], color: Colors.red),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider();
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            width: MediaQuery.of(context).size.width,
            height: 70,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.red),
                child: const Text('Pay'),
                onPressed: () {
                  Navigator.of(context).pushNamed("success_checkout");
                }),
          ),
        ],
      ),
    );
  }
}
