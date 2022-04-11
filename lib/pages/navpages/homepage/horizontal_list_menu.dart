import 'package:flutter/material.dart';
import 'package:food_order/providers/products.dart';
import 'package:food_order/utils/constants.dart';
import 'package:provider/provider.dart';

class HorizontalListMenu extends StatefulWidget {
  const HorizontalListMenu({Key? key}) : super(key: key);

  @override
  State<HorizontalListMenu> createState() => _HorizontalListMenuState();
}

class _HorizontalListMenuState extends State<HorizontalListMenu> {
  int currentIdx = 0;

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      height: 40,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categoryListConstant.length,
          itemBuilder: (BuildContext context, int index) {
            return HorizontalListItem(
                isSelected: index == currentIdx ? true : false,
                label: categoryListConstant[index],
                onPressed: () {
                  products.setSelectedCategory = categoryListConstant[index];
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
              ? Color.fromARGB(201, 228, 33, 23)
              : const Color.fromRGBO(245, 247, 251, 1),
          // border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(20),
        ),
        margin: const EdgeInsets.only(left: 10),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Center(
          child: Text(
            categoryEmoji.containsKey(label)
                ? "${categoryEmoji[label]}  $label"
                : "$label",
            style: TextStyle(
                fontSize: 14, color: isSelected! ? Colors.white : Colors.black),
          ),
        ),
      ),
    );
  }
}
