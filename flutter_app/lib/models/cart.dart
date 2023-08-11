```dart
class Cart {
  final String id;
  final String productId;
  final int quantity;

  Cart({required this.id, required this.productId, required this.quantity});

  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(
      id: json['id'],
      productId: json['productId'],
      quantity: json['quantity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'productId': productId,
      'quantity': quantity,
    };
  }
}
```