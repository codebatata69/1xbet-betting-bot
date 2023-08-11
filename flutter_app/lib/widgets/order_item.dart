import 'package:flutter/material.dart';
import 'package:flutter_app/models/order.dart';

class OrderItem extends StatelessWidget {
  final Order order;

  OrderItem({@required this.order});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.shopping_cart),
        title: Text(order.productName),
        subtitle: Text('Quantity: ${order.quantity}'),
        trailing: Text('\$${order.totalPrice.toStringAsFixed(2)}'),
      ),
    );
  }
}