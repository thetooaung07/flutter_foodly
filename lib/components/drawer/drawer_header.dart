import 'package:flutter/material.dart';

class DrawerHeaderComponent extends StatelessWidget {
  const DrawerHeaderComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UserAccountsDrawerHeader(
        decoration: BoxDecoration(color: Colors.transparent),
        arrowColor: Colors.black,
        accountName: Text(
          "customer@gmail.com",
          style: TextStyle(color: Colors.black),
        ),
        accountEmail: Text(
          "Customer",
          style: TextStyle(color: Colors.black),
        ),
        currentAccountPicture: CircleAvatar(
          backgroundImage: AssetImage("assets/images/discord_profile.png"),
        ));
  }
}
