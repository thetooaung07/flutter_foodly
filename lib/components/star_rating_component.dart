import 'package:flutter/material.dart';

class StarRatingComponent extends StatelessWidget {
  final double rating;
  final int? reviewsCount;
  final bool? isReviewed;
  final TextStyle? ratingTextStyle;
  const StarRatingComponent(
      {Key? key,
      required this.rating,
      this.reviewsCount = 0,
      this.ratingTextStyle,
      this.isReviewed = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.star_rounded,
          color: Colors.yellow,
        ),
        const SizedBox(width: 5),
        Text(
          rating.toString(),
          style: ratingTextStyle ??
              const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        const SizedBox(width: 10),
        isReviewed!
            ? Text("(${reviewsCount.toString()} Reviews)")
            : const Text(" "),
      ],
    );
  }
}
