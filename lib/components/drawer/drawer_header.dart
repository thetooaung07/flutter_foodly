import 'package:flutter/material.dart';

class DrawerHeaderComponent extends StatelessWidget {
  const DrawerHeaderComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 20, 5, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 50,
          ),
          SizedBox(
            height: 30,
          ),
          Text("Thet Oo Aung"),
          SizedBox(
            height: 10,
          ),
          Text("thetooaung07@gmail.com"),
        ],
      ),
    );
  }
}
