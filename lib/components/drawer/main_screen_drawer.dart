// import 'package:flutter/material.dart';
// import 'package:food_order/components/drawer/drawer_header.dart';
// import 'package:food_order/components/drawer/drawer_item.dart';
// import 'package:food_order/providers/theme_provider.dart';
// import 'package:provider/provider.dart';

// class MainScreenDrawer extends StatefulWidget {
//   const MainScreenDrawer({Key? key}) : super(key: key);

//   @override
//   State<MainScreenDrawer> createState() => _MainScreenDrawerState();
// }

// class _MainScreenDrawerState extends State<MainScreenDrawer> {
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       // backgroundColor: Colors.black,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const SizedBox(
//               height: 30,
//             ),
//             const DrawerHeaderComponent(),
//             ElevatedButton(onPressed: () {}, child: Text("TEst")),
//             Row(
//               children: [
//                 Text("☀️"),
//                 Consumer<ThemeProvider>(
//                   builder:
//                       (BuildContext context, themeProvider, Widget? child) {
//                     return Switch(
//                       onChanged: (value) {
//                         // value = !value;
//                         final provider =
//                             Provider.of<ThemeProvider>(context, listen: false);
//                         provider.toggleTheme(value);
//                       },
//                       value: themeProvider.isDarkMode,
//                     );
//                   },
//                 ),
//                 Text("🌙"),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
