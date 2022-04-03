import 'package:flutter/material.dart';

const CATEGORY_LIST = [
  "Recommend",
  "Junk Food",
  "Vegan",
  "Beef",
  "Snack",
  "Something",
  "Lorem"
];

class HorizontalListMenu extends StatefulWidget {
  const HorizontalListMenu({Key? key}) : super(key: key);

  @override
  State<HorizontalListMenu> createState() => _HorizontalListMenuState();
}

class _HorizontalListMenuState extends State<HorizontalListMenu> {
  int currentIdx = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: 40,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: CATEGORY_LIST.length,
          itemBuilder: (BuildContext context, int index) {
            return HorizontalListItem(
                isSelected: index == currentIdx ? true : false,
                label: CATEGORY_LIST[index],
                onPressed: () {
                  setState(() {
                    currentIdx = index;
                  });
                });
          }),
    );
  }
}

class HorizontalListItem extends StatelessWidget {
  final String label;
  final Function() onPressed;
  final bool? isSelected;

  const HorizontalListItem({
    Key? key,
    required this.label,
    required this.onPressed,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected!
              ? Color.fromRGBO(238, 77, 42, 1)
              : Color.fromRGBO(245, 247, 251, 1),
          // border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(20),
        ),
        margin: EdgeInsets.only(left: 10),
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
                fontSize: 14, color: isSelected! ? Colors.white : Colors.black),
          ),
        ),
      ),
    );
  }
}
