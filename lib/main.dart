import 'package:flutter/material.dart';
import 'package:food_order/components/badge.dart';
import 'package:food_order/components/drawer/main_screen_drawer.dart';
import 'package:food_order/pages/details_page.dart';
import 'package:food_order/pages/navpages/home_page.dart';
import 'package:food_order/pages/navpages/order_history.dart';
import 'package:food_order/pages/navpages/user_profile.dart';
import 'package:food_order/pages/shopping_cart_page/shopping_cart_page.dart';
import 'package:food_order/providers/cart.dart';
import 'package:food_order/providers/products.dart';
import 'package:food_order/providers/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (ctx) => Products()),
          ChangeNotifierProvider(create: (ctx) => Cart()),
          // ChangeNotifierProvider(create: (ctx) => ThemeProvider())
        ],
        builder: (context, child) {
          // final themeProvider = Provider.of<ThemeProvider>(context);

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            onGenerateRoute: (settings) {
              switch (settings.name) {
                case "home":
                  return MaterialPageRoute(
                      builder: (context) => (const HomePage()));
                case "details_page":
                  return MaterialPageRoute(
                      builder: (context) => (DetailsPage(
                            productId: settings.arguments.toString(),
                          )));
                case "shopping_cart_page":
                  return MaterialPageRoute(
                      builder: (context) => (const ShoppingCartPage()));
                default:
                  return MaterialPageRoute(
                      builder: (context) => (const HomePage()));
              }
            },
            title: 'Shopy',
            // themeMode: themeProvider.themeMode,
            theme: ThemeData(
                appBarTheme: AppBarTheme(backgroundColor: Colors.red)),
            // darkTheme: MyTheme.darkTheme,
            home: MainScreen(),
          );
        });
  }
}

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  int currentIndex = 0;
  List pages = [
    HomePage(),
    OrderHistoryPage(),
    UserProfilePage(),
    ShoppingCartPage(),
  ];
  void onTap(int index) {
    if (index == pages.length - 1) {
      Navigator.of(context).pushNamed("shopping_cart_page");
      setState(() {
        currentIndex = 0;
      });
    } else {
      setState(() {
        currentIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: scaffoldKey,
      // drawer: MainScreenDrawer(),
      // appBar: AppBar(
      //   leading: IconButton(
      //     icon: const Icon(Icons.space_dashboard_rounded),
      //     // onPressed: () => scaffoldKey.currentState?.openDrawer(),
      //     onPressed: () => null,
      //   ),
      //   title: Column(
      //     children: const [
      //       Text(
      //         "Location",
      //         style: TextStyle(fontSize: 13),
      //       ),
      //       Text(
      //         "Yangon, MM",
      //         style: TextStyle(fontSize: 15),
      //       )
      //     ],
      //   ),
      //   centerTitle: true,
      // ),
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 0,
        unselectedFontSize: 0,
        // backgroundColor: Colors.transparent,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        onTap: onTap,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.apps), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.history_rounded), label: "History"),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_rounded),
            label: "User",
          ),
          // BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: "Bar"),
          BottomNavigationBarItem(
              icon: Consumer<Cart>(
                builder: (_, cart, ch) => Badge(
                  child: ch!,
                  value: cart.itemCount.toString(),
                ),
                child: IconButton(
                  icon: const Icon(Icons.shopping_cart),
                  onPressed: () {
                    Navigator.of(context).pushNamed("shopping_cart_page");
                  },
                ),
              ),
              label: "Shopping Cart"),
        ],
      ),
    );
  }
}

// .space_dashboard_rounded
// subject_rounded
// table_rows_rounded
// view_headline_rounded
