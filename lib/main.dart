import 'package:flutter/material.dart';
import 'package:food_order/components/badge.dart';
import 'package:food_order/pages/checkout_confirm_page.dart';
import 'package:food_order/pages/navpages/home_page.dart';
import 'package:food_order/pages/navpages/order_history.dart';
import 'package:food_order/pages/navpages/user_profile.dart';
import 'package:food_order/pages/notification_page.dart';
import 'package:food_order/pages/product_details_page.dart';
import 'package:food_order/pages/shopping_cart_page/shopping_cart_page.dart';
import 'package:food_order/pages/success.dart';
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
          ChangeNotifierProvider(create: (ctx) => Cart()),
        ],
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            onGenerateRoute: (settings) {
              switch (settings.name) {
                case "home":
                  return MaterialPageRoute(
                      builder: (context) => (const MainScreen()));
                case "details_page":
                  return MaterialPageRoute(
                      builder: (context) => (ProductDetailsPage(
                            productId: settings.arguments.toString(),
                          )));
                case "shopping_cart_page":
                  return MaterialPageRoute(
                      builder: (context) => (const ShoppingCartPage()));
                case "notification_page":
                  return MaterialPageRoute(
                      builder: (context) => (const NotificationPage()));
                case "checkout_confirm_page":
                  return MaterialPageRoute(
                      builder: (context) => (const CheckOutConfirmPage()));
                case "success_checkout":
                  return MaterialPageRoute(
                      builder: (context) => (const Success()));
                default:
                  return MaterialPageRoute(
                      builder: (context) => (const MainScreen()));
              }
            },
            title: 'Shopy',
            // themeMode: themeProvider.themeMode,
            theme: ThemeData(
                appBarTheme: const AppBarTheme(backgroundColor: Colors.red)),
            // darkTheme: MyTheme.darkTheme,
            home: const MainScreen(),
          );
        });
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final PageController _pageController = PageController(initialPage: 0);

  int currentIndex = 0;
  List pages = [
    const HomePage(),
    const OrderHistoryPage(),
    const UserProfilePage(),
    const ShoppingCartPage(),
  ];
  void onTap(int index) {
    setState(() {
      currentIndex = index;
      _pageController.animateToPage(index,
          duration: const Duration(milliseconds: 500), curve: Curves.ease);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        onPageChanged: (newIndex) {
          setState(() {
            currentIndex = newIndex;
          });
        },
        controller: _pageController,
        children: const [
          HomePage(),
          OrderHistoryPage(),
          UserProfilePage(),
          ShoppingCartPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 0,
        unselectedFontSize: 0,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        onTap: onTap,
        items: [
          const BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.all(10.0),
                child: Icon(Icons.apps),
              ),
              label: "Home"),
          const BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.all(10.0),
                child: Icon(Icons.history_rounded),
              ),
              label: "History"),
          const BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.all(10.0),
              child: Icon(Icons.person_outline_rounded),
            ),
            label: "User",
          ),
          BottomNavigationBarItem(
              icon: Consumer<Cart>(
                builder: (_, cart, ch) => Badge(
                  child: ch!,
                  value: cart.itemCount.toString(),
                ),
                child: const Padding(
                    padding: EdgeInsets.all(10),
                    child: Icon(Icons.shopping_cart)),
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
