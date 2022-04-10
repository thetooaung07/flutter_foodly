import 'package:flutter/material.dart';
import 'package:food_order/components/drawer/drawer_header.dart';
import 'package:food_order/components/drawer/drawer_item.dart';
import 'package:food_order/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class MainScreenDrawer extends StatelessWidget {
  const MainScreenDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Drawer(
      // backgroundColor: Colors.black,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            const DrawerHeaderComponent(),
            const SizedBox(
              width: double.infinity,
              child: Divider(
                thickness: 2,
                height: 3,
                color: Colors.black,
              ),
            ),
            Switch.adaptive(
                value: themeProvider.isDarkMode,
                onChanged: (value) {
                  themeProvider.toggleTheme(value);
                })
          ],
        ),
      ),
    );
  }
}
