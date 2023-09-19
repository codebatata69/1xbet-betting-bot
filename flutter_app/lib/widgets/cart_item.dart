import 'package:flutter/material.dart';
import 'package:flutter_app/models/cart.dart';

class CartItem extends StatelessWidget {
  final Cart cart;

  CartItem({@required this.cart});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(cart.product.imageUrl),
        title: Text(cart.product.name),
        subtitle: Text('\$${cart.product.price.toStringAsFixed(2)}'),
        trailing: Text('x${cart.quantity}'),
      ),
    );
  }
}