import 'package:flutter/material.dart';
import 'package:food_order/components/drawer/main_screen_drawer.dart';
import 'package:food_order/pages/navpages/home_page.dart';
import 'package:food_order/pages/navpages/search_page.dart';
import 'package:food_order/pages/navpages/user_profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // initialRoute: "home",
      // onGenerateRoute: (settings) {
      //   switch (settings.name) {
      //     case "home":
      //       return MaterialPageRoute(builder: (context) => (MyHomePage()));
      //     case "searchpage":
      //       return MaterialPageRoute(builder: (context) => (SearchPage()));
      //     default:
      //       return MaterialPageRoute(builder: (context) => (MyHomePage()));
      //   }
      // },
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.red),
      home: MainScreen(),
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
              child: GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.shopping_cart_outlined,
                  size: 26.0,
                ),
              )),
        ],
      ),
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
            icon: Icon(Icons.search),
            label: "Search",
          ),
          // BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: "Bar"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border_rounded), label: "Favourite"),
        ],
      ),
    );
  }
}

// .space_dashboard_rounded
// subject_rounded
// table_rows_rounded
// view_headline_rounded
