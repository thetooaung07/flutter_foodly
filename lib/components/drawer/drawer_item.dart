import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  final String label;
  final Function() onPressed;
  final IconData icon;
  final Widget? customWidget;

  const DrawerItem(
      {Key? key,
      required this.label,
      required this.onPressed,
      required this.icon,
      this.customWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: SizedBox(
        height: 40,
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Icon(
            icon,
            size: 25,
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            label,
            style: const TextStyle(fontSize: 18),
          )
        ]),
      ),
    );
  }
}
