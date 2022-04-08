import 'package:flutter/material.dart';

class DrawerHeaderComponent extends StatelessWidget {
  const DrawerHeaderComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 20, 5, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage("assets/images/anime_profile.png"),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const Icon(Icons.exit_to_app),
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          const Text("Customer"),
          const SizedBox(
            height: 10,
          ),
          const Text("customer07@gmail.com"),
        ],
      ),
    );
  }
}
