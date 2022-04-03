import 'package:flutter/material.dart';

class HorizontalListMenu extends StatelessWidget {
  const HorizontalListMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: 40,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          HorizontalListItem(
            label: "Recommend",
            onPressed: () {},
          ),
          HorizontalListItem(
            label: "Junk Food",
            onPressed: () {},
          ),
          HorizontalListItem(
            label: "Vegan",
            onPressed: () {},
          ),
          HorizontalListItem(
            label: "Beef",
            onPressed: () {},
          ),
          SizedBox(
            width: 15,
          )
        ],
      ),
    );
  }
}

class HorizontalListItem extends StatelessWidget {
  final String label;
  final Function() onPressed;

  const HorizontalListItem({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(20),
      ),
      margin: EdgeInsets.only(left: 10),
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Center(
        child: Text(
          label,
          style: TextStyle(fontSize: 14, color: Colors.black),
        ),
      ),
    );
  }
}
