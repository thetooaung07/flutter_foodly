import 'package:flutter/material.dart';

const Color buttonBg = Color.fromARGB(153, 0, 0, 0);

// enum CategoryName {
//   Recommend,Junk Food, Snack
// }

// const Map categoryEmoji = {
//   "Recommend": "🥗",
//   "Junk Food": "🍕",
//   "Snack": "🍔",
// };

const Map<String, Map> categoryUtils = {
  "Recommend": {
    "emoji": "🥗",
    "color": Colors.red,
  },
  "Junk Food": {
    "emoji": "🍕",
    "color": Colors.orange,
  },
  "Snack": {
    "emoji": "🍔",
    "color": Colors.yellow,
  }
};
