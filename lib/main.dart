import 'package:flutter/material.dart';
import 'package:food_order/components/badge.dart';
import 'package:food_order/components/drawer/main_screen_drawer.dart';
import 'package:food_order/pages/details_page.dart';
import 'package:food_order/pages/navpages/home_page.dart';
import 'package:food_order/pages/navpages/search_page.dart';
import 'package:food_order/pages/navpages/user_profile.dart';
import 'package:food_order/pages/shopping_cart_page/shopping_cart_page.dart';
import 'package:food_order/providers/cart.dart';
import 'package:food_order/providers/products.dart';
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
        ChangeNotifierProvider(create: (ctx) => Cart())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case "home":
              return MaterialPageRoute(builder: (context) => (HomePage()));
            case "details_page":
              return MaterialPageRoute(
                  builder: (context) => (DetailsPage(
                        productId: settings.arguments.toString(),
                      )));
            case "shopping_cart_page":
              return MaterialPageRoute(
                  builder: (context) => (ShoppingCartPage()));
            default:
              return MaterialPageRoute(builder: (context) => (HomePage()));
          }
        },
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.red),
        home: MainScreen(),
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  List pages = [
    HomePage(),
    SearchPage(),
    WishlistPage(),
  ];
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: MainScreenDrawer(),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.space_dashboard_rounded),
          onPressed: () => scaffoldKey.currentState?.openDrawer(),
        ),
        title: Column(
          children: [
            Text(
              "Location",
              style: TextStyle(fontSize: 13),
            ),
            Text(
              "Yangon, MM",
              style: TextStyle(fontSize: 15),
            )
          ],
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Consumer<Cart>(
              builder: (_, cart, ch) => Badge(
                child: ch!,
                value: cart.itemCount.toString(),
              ),
              child: IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.of(context).pushNamed("shopping_cart_page");
                },
              ),
            ),
          ),
        ],
      ),
      body: pages[currentIndex],
      // bottomNavigationBar: BottomNavigationBar(
      //   selectedFontSize: 0,
      //   unselectedFontSize: 0,
      //   // backgroundColor: Colors.transparent,
      //   type: BottomNavigationBarType.fixed,
      //   currentIndex: currentIndex,
      //   selectedItemColor: Colors.red,
      //   unselectedItemColor: Colors.grey,
      //   showUnselectedLabels: false,
      //   showSelectedLabels: false,
      //   onTap: onTap,
      //   items: [
      //     BottomNavigationBarItem(icon: Icon(Icons.apps), label: "Home"),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.search),
      //       label: "Search",
      //     ),
      //     // BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: "Bar"),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.favorite_border_rounded), label: "Favourite"),
      //   ],
      // ),
    );
  }
}

// .space_dashboard_rounded
// subject_rounded
// table_rows_rounded
// view_headline_rounded
