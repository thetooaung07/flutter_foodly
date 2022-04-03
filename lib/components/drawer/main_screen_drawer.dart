import 'package:flutter/material.dart';
import 'package:food_order/components/drawer/drawer_header.dart';
import 'package:food_order/components/drawer/drawer_item.dart';

class MainScreenDrawer extends StatelessWidget {
  const MainScreenDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // backgroundColor: Colors.black,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            DrawerHeaderComponent(),
            SizedBox(
              width: double.infinity,
              child: Divider(
                thickness: 1,
                height: 10,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            DrawerItem(
              label: "Notification",
              onPressed: () {},
              icon: Icons.notifications_none_rounded,
            ),
            SizedBox(
              height: 20,
            ),
            DrawerItem(
                label: "Chat",
                onPressed: () {},
                icon: Icons.messenger_outline_rounded),
            SizedBox(
              height: 20,
            ),
            DrawerItem(
              label: "History",
              onPressed: () {},
              icon: Icons.access_time,
            ),
            SizedBox(
              height: 20,
            ),
            DrawerItem(
              label: "Terms and Conditions",
              onPressed: () {},
              icon: Icons.error_outline_rounded,
            ),
            SizedBox(
              height: 20,
            ),
            DrawerItem(
              label: "Settings",
              onPressed: () {},
              icon: Icons.settings_outlined,
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
