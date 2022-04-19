import 'package:flutter/material.dart';
import 'package:food_order/components/badge.dart';
import 'package:food_order/utils/constants.dart';

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
            greeting(),
            style: const TextStyle(fontSize: 18),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text("What do you want to order today?"),
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
                    return const Opacity(
                        opacity: 0.5,
                        child: Icon(Icons.notifications_none_rounded));
                  },
                  child: NotificationBadge(
                    child: const Icon(Icons.notifications_none_rounded),
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
            child: SizedBox(
              height: 300,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
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
      margin: const EdgeInsets.only(bottom: 10),
      height: 60,
      decoration: const BoxDecoration(
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
              margin: const EdgeInsets.only(left: 10),
              width: 50,
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                      image: AssetImage("assets/images/hot_pot.jpeg"))),
            ),
            const SizedBox(width: 15),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    Text("Jon Doe"),
                    Text("joins Foody Today.Order Now"),
                  ],
                ),
                const Text("2h ago"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
