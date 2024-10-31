// cart.dart
class CartItem {
  final String name;
  final String imageUrl;
  final String category;
  final int price;
  int quantity;

  CartItem({
    required this.name,
    required this.imageUrl,
    required this.category,
    required this.price,
    this.quantity = 1,
  });
}
