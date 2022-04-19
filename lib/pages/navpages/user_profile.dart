import 'package:flutter/material.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Account"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 30, 20, 10),
          child: Column(children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8),
              child: Row(children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.red,
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "User",
                      style: TextStyle(fontSize: 25),
                    ),
                    SubscriptionBadge(
                      sType: "FREE",
                    ),
                  ],
                )
              ]),
            ),
            SizedBox(height: 20),
            Card(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //UserName
                    Text("Display Name"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Jane Doe"),
                        ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(Colors.red)),
                          child: Text("Edit"),
                        ),
                      ],
                    ),

                    SizedBox(height: 15),

                    //Email
                    Text("Display Name"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Jane Doe"),
                        ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(Colors.red)),
                          child: Text("Edit"),
                        ),
                      ],
                    ),

                    SizedBox(height: 15),
                    //Password
                    Text("Display Name"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Jane Doe"),
                        ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(Colors.red)),
                          child: Text("Edit"),
                        ),
                      ],
                    ),

                    SizedBox(height: 15),
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //UserName
                    Text("Subscription"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Tsks Free"),
                        ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(Colors.red)),
                          child: Text("Edit"),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("See all of Pro Benefits"),
                          Icon(
                            Icons.arrow_forward_rounded,
                            size: 20,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

class SubscriptionBadge extends StatelessWidget {
  final String sType;
  const SubscriptionBadge({Key? key, required this.sType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(3),
      padding: EdgeInsets.symmetric(horizontal: 7, vertical: 2),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        border: Border.all(color: Colors.black45),
      ),
      child: Text(
        sType,
      ),
    );
  }
}

// Container with gradient border

// Container(
//       alignment: Alignment.center,
//       decoration: BoxDecoration(
//         borderRadius: const BorderRadius.all(Radius.circular(5)),
//         gradient: LinearGradient(
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//             colors: [
//               Color.fromARGB(255, 178, 83, 187),
//               Color.fromARGB(255, 194, 26, 236),
//             ]),
//       ),
//       child: Container(
//         margin: EdgeInsets.all(3),
//         padding: EdgeInsets.symmetric(horizontal: 7, vertical: 2),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: const BorderRadius.all(Radius.circular(5)),
//         ),
//         child: Text(
//           "FREE",
//         ),
//       ),
//     );
