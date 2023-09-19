```dart
class Order {
  final String id;
  final double amount;
  final List<OrderItem> products;
  final DateTime dateTime;

  Order({
    required this.id,
    required this.amount,
    required this.products,
    required this.dateTime,
  });
}

class OrderItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  OrderItem({
    required this.id,
    required this.title,
    required this.quantity,
    required this.price,
  });
}
```