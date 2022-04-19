import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notification"),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.format_line_spacing_rounded))
        ],
      ),
      body: Column(children: const [
        NotificationItem(),
        NotificationItem(),
        NotificationItem(),
        NotificationItem(),
      ]),
    );
  }
}

class NotificationItem extends StatelessWidget {
  const NotificationItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String name = "Rider One";

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 80,
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 70,
            // height: 80,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: const DecorationImage(
                    image: AssetImage("assets/images/hot_pot.jpeg"))),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: RichText(
                      text: const TextSpan(
                          style: TextStyle(color: Colors.black45),
                          children: [
                            TextSpan(
                                text: name,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54)),
                            TextSpan(
                                text:
                                    " is now heading to your location to deliver your Order.")
                          ]),
                      // "${name} is now heading to your location to deliver your Order.",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const Text(
                    "2h ago",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black45),
                  )
                ],
              ),
            ),
          ),
          Container(
            width: 50,
            // height: 80,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: const DecorationImage(
                    image: AssetImage("assets/images/hot_pot.jpeg"))),
          ),
        ],
      ),
    );
  }
}
