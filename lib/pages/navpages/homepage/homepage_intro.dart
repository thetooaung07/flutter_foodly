import 'package:flutter/material.dart';
import 'package:food_order/components/badge.dart';
import 'package:food_order/components/hero_dialog_route.dart';

class HomePageIntro extends StatefulWidget {
  const HomePageIntro({Key? key}) : super(key: key);

  @override
  State<HomePageIntro> createState() => _HomePageIntroState();
}

class _HomePageIntroState extends State<HomePageIntro> {
  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 30, 20, 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Hello User",
            style: TextStyle(fontSize: 25),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("What do you want to order today?"),
              GestureDetector(
                onTap: () {
                  // Navigator.of(context).push(
                  //   HeroDialogRoute(
                  //     builder: (context) => Center(
                  //       child: PopUpNotification(),
                  //     ),
                  //   ),
                  // );
                  Navigator.of(context).pushNamed("notification_page");
                  setState(() {
                    isClicked = true;
                  });
                },
                child: Hero(
                  tag: "popUpNotification",
                  placeholderBuilder: (context, size, widget) {
                    return Opacity(
                        opacity: 0.5,
                        child: Icon(Icons.notifications_none_rounded));
                  },
                  child: NotificationBadge(
                    child: Icon(Icons.notifications_none_rounded),
                    isNew: !isClicked,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PopUpNotification extends StatelessWidget {
  const PopUpNotification({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "popUpNotification",
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 10, 10, 220),
        child: Material(
          borderRadius: BorderRadius.circular(10),
          child: SizedBox(
            child: Container(
              height: 300,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    PopUpNotificationItem(),
                    PopUpNotificationItem(),
                    PopUpNotificationItem(),
                    PopUpNotificationItem(),
                    PopUpNotificationItem(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PopUpNotificationItem extends StatelessWidget {
  const PopUpNotificationItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      height: 60,
      decoration: BoxDecoration(
        color: Colors.transparent,
        //   border: Border(
        // bottom: BorderSide(width: 1.0, color: Colors.lightBlue.shade900),
        // top: BorderSide(width: 1.0, color: Colors.lightBlue.shade900),
        // left: BorderSide(width: 1.0, color: Colors.lightBlue.shade900),
        // right: BorderSide(width: 1.0, color: Colors.lightBlue.shade900),
        //  ),
      ),
      child: SingleChildScrollView(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 10),
              width: 50,
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage("assets/images/hot_pot.jpeg"))),
            ),
            SizedBox(width: 15),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text("Jon Doe"),
                    Text("joins Foody Today.Order Now"),
                  ],
                ),
                Text("2h ago"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
