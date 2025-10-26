class CartItem {
  final String title;
  final double price;
  final int? count; // عدد الغسلات
  final int? remain; // للـ subscription
  final String type; // "one_time" أو "subscription"

  CartItem({
    required this.title,
    required this.price,
    this.count,
    this.remain,
    required this.type,
  });
}
