class ShoppingCart {
  final String imgPath;
  final String category;
  final String label;
  final String waitingTime;
  final String? description;
  bool? isInCart;

  ShoppingCart(
      {required this.imgPath,
      required this.category,
      required this.label,
      required this.waitingTime,
      this.isInCart = false,
      this.description = "No Description is Provided yet."});

  @override
  String toString() {
    return "img Path $imgPath => category $category => label $label => waitingTime $waitingTime => description $description => isInCart $isInCart";
  }
}
