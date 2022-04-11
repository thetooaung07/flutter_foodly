import 'package:flutter/material.dart';

class Badge extends StatelessWidget {
  final Widget child;
  final String value;
  final Color? color;
  const Badge({
    Key? key,
    required this.child,
    required this.value,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        child,
        Positioned(
          right: 0,
          top: 0,
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: value == "0" ? Colors.grey : Colors.red,
            ),
            constraints: const BoxConstraints(
              minWidth: 15,
              minHeight: 15,
            ),
            child: Text(
              value,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 10,
              ),
            ),
          ),
        )
      ],
    );
  }
}

class NotificationBadge extends StatelessWidget {
  final Widget child;
  final bool? isNew;
  final Color? color;
  const NotificationBadge({
    Key? key,
    required this.child,
    this.isNew = false,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        child,
        Positioned(
          right: 2,
          top: 2,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isNew! ? Colors.red : Colors.transparent),
            alignment: Alignment.center,
          ),
        )
      ],
    );
  }
}
